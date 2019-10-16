import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'BestDoctors.dart';
import 'DoctorDataTypes.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Doctor Directory'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Speciality> doctors = List();

  GlobalKey<AutoCompleteTextFieldState<Speciality>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  List<Widget> search = new List<Widget>();

  BestDoctors bd = new BestDoctors();

  @override
  void initState() {
    super.initState();

  }

  void searchDoctor(String s_uid){

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DectorSearchPage (

        uid: s_uid,
        location: null
    )));
  }

  Widget createSearchView(BuildContext context, AsyncSnapshot snapshot) {
    List<Speciality> values = snapshot.data;
    searchTextField = new AutoCompleteTextField<Speciality>(
        style: new TextStyle(color: Colors.black, fontSize: 16.0),
        decoration: new InputDecoration(
            suffixIcon: Container(
              width: 85.0,
              height: 60.0,
            ),
            contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
            filled: true,
            hintText: 'Search Speciality of doctor',
            hintStyle: TextStyle(color: Colors.black)),

          itemSubmitted: (item) {
          setState(() => searchTextField.textField.controller.text = item.uid);
          searchDoctor(item.uid);
        },
        clearOnSubmit: false,
        key: key,
        suggestions: values,
        itemBuilder: (context, item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item.name,
                style: TextStyle(
                    fontSize: 16.0
                ),),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Text(item.category,
              )
            ],
          );
        },
        itemSorter: (a, b) {
          return a.name.compareTo(b.name);
        },
        itemFilter: (item, query) {

          debugPrint("===="+query+"==="+item.name);

          return item.name
              .toLowerCase()
              .startsWith(query.toLowerCase());
        });

    return searchTextField;
  }

  @override
  Widget build(BuildContext context) {

    var futureBuilder = new FutureBuilder(
      future: bd.LoadSpecialities(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: Text('Loading...',style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
                ),
              ),
            );
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createSearchView(context,snapshot);
        }
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: futureBuilder
    );
  }
}


class DectorSearchPage extends StatelessWidget {

  String uid;
  String location;

  BestDoctors bd;

  DoctorSearchResponse res;

  DectorSearchPage({ this.uid , this.location});

  Widget createSearchView(BuildContext context, AsyncSnapshot snapshot){

    res=snapshot.data;

    return ListView.builder(
      itemCount: res.data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(res.data[index].profile.firstName + " "+ res.data[index].profile.lastName),
          onTap: () => showDoctorDetails(context ,index),
        );
      },
    );
  }

  void showDoctorDetails(BuildContext context, int index){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorDetailsPage (

        uid: res.data[index].uid
    )));
  }

  @override
  Widget build(BuildContext context) {

    bd =new BestDoctors();

    var futureBuilder = new FutureBuilder(
      future: bd.searchDoctor(location, uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createSearchView(context,snapshot);
        }
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(uid),
        ),
        body: futureBuilder
    );
  }
}

//  Details Page

class DoctorDetailsPage extends StatelessWidget {

  String uid;

  DoctorDetailsPage({this.uid });

  BestDoctors bd;

  WebViewController _controller;

  Widget createDoctorView(BuildContext context, AsyncSnapshot snapshot) {

    DoctorsByUIDResponse res=snapshot.data;


    return WebView(
        initialUrl: Uri.dataFromString(BuildHtml(res.data) , mimeType: 'text/html').toString(),
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        });
    //  return new Text('Doc Data ' + res.data.profile.lastName + "\n" + res.data.profile.bio );
  }

  @override
  Widget build(BuildContext context) {

    bd =new BestDoctors();

    var futureBuilder = new FutureBuilder(
      future: bd.getDoctoryByUId( this.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...' + uid);
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createDoctorView(context,snapshot);
        }
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(uid),
        ),
        body: futureBuilder
    );
  }


  // Html Builder
  String BuildHtml(Data data){

    String html="<html></body>";
    html +="<table width='100%'><tr><td><h2><b>"+  data.profile.firstName + " " +  data.profile.lastName +"</b></h2>";

    data.educations.forEach((f) {
      html+= "<br/>" + f.degree + " "+ f.graduationYear ;
    });

    html += "<br/><b>(";
    data.specialties.forEach((f) {
      html+= "" + f.name + " " ;
    });

    html += ")</b>";
    html += "</td><td align='right''>";

    html +="<img src='" + data.profile.imageUrl + "'/></td></tr></table>";

    html += "<br/>" + data.profile.bio;

    //html += "<hr/>";

    if(data.practices.length > 0 ){
      html +="<h4>Practices</h4>";
    }

    debugPrint("================");

    data.practices.forEach((f){

      html += "<div style=' box-shadow: 0 1px 8px 0 rgba(0, 0, 0, 0.2), 0 2px 20px 0 rgba(0, 0, 0, 0.19); margin-top: 20px;padding-bottom: 3px; padding-top: 3px;padding-left: 6px; padding-right: 6px'><b>"+ f.name +"</b><br/>";
      if(f.phones != null ) {
        f.phones.forEach((ph) {
          html += "<br/>" + ph.type + " : <a href='tel:" + ph.number + "' >" +
              ph.number + "</a>";
          // html += ("<br/>" + ph.type + " " + ph.number);
        });
      }

      if(f.website != null){
        debugPrint("Website: <a href='" + f.website + "'>"+ f.website +"</a>");
      }

      // html += "Website: <a href='" + f.website + "'>"+ f.website +"</a>";

      html += "</div>";
    });

    if(data.licenses != null){

      html += "<h4>Licenses</h4>";
      data.licenses.forEach((f){

        html += "<div style=' box-shadow: 0 1px 8px 0 rgba(0, 0, 0, 0.2), 0 2px 20px 0 rgba(0, 0, 0, 0.19); margin-top: 20px;padding-bottom: 3px; padding-top: 3px;padding-left: 6px; padding-right: 6px'>"+ f.number +" "  +f.state +"<br/>";

        html += "</div>";
      });
    }

    /*if(data.insurances !=null){

      html += "<h4>Insurances</h4>";

      data.insurances.forEach((f){

        if(f.insurancePlan != null && f.insuranceProvider !=null) {
          html +=
              "<div style=' box-shadow: 0 1px 8px 0 rgba(0, 0, 0, 0.2), 0 2px 20px 0 rgba(0, 0, 0, 0.19); margin-top: 20px;padding-bottom: 3px; padding-top: 3px;padding-left: 6px; padding-right: 6px'><b>" +
                  f.insurancePlan.name + "  Provided by" + f.insuranceProvider.name +
                  "</b><br/>";

          html += "</div>";
        }
      });

    }*/

    debugPrint(data.profile.imageUrl);

    debugPrint(html);

    html += "</body></html>";

    return html;
  }
}