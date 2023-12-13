import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  final String data = """<p><strong>Privacy Policy</strong></p>
<p><strong>Last Updated:</strong> December 13 2023</p>
<ol>
<li><strong> Introduction</strong></li>
</ol>
<p>Neonflake Enterprises (OPC) Pvt Ltd ("us", "we", or "our") operates the Leadesh mobile application (the "Service"). This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.</p>
<ol start="2">
<li><strong> Information Collection and Use</strong></li>
</ol>
<p>We collect several different types of information for various purposes to provide and improve our Service.</p>
<ol start="3">
<li><strong> Types of Data Collected</strong></li>
</ol>
<p><strong>Personal Data:</strong></p>
<p>While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you.</p>
<p><strong>Usage Data:</strong></p>
<p>We may also collect information on how the Service is accessed and used ("Usage Data"). This Usage Data may include information such as your device's Internet Protocol address (e.g., IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers, and other diagnostic data.</p>
<ol start="4">
<li><strong> Use of Data</strong></li>
</ol>
<p>We use the collected data for various purposes, including but not limited to:</p>
<ul>
<li>To provide and maintain our Service.</li>
<li>To notify you about changes to our Service.</li>
<li>To provide customer support.</li>
<li>To gather analysis or valuable information so that we can improve our Service.</li>
</ul>
<ol start="5">
<li><strong> Security</strong></li>
</ol>
<p>The security of your data is important to us, but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.</p>
<ol start="6">
<li><strong> Changes to This Privacy Policy</strong></li>
</ol>
<p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.</p>
<ol start="7">
<li><strong> Contact Us</strong></li>
</ol>
<p>&nbsp;</p>
<p>If you have any questions about this Privacy Policy, please contact Neonflake Enterprises (OPC) Pvt Ltd at contact@leadesh.com.</p>
<p>By using the Service, you agree to the collection and use of information in accordance with this policy.</p>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Privacy Policy")),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Html(
              data: data,
            )),
      ),
    );
  }
}
