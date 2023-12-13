import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  final String data = """<p><strong>Terms and Conditions</strong></p>
<p><strong>Last Updated:</strong> December 13 2023</p>
<ol>
<li><strong> Acceptance of Terms</strong></li>
</ol>
<p>By accessing or using the Leadesh mobile application (the "Service"), you agree to comply with and be bound by these Terms and Conditions. If you disagree with any part of the terms, you may not access the Service.</p>
<ol start="2">
<li><strong> Use of the Service</strong></li>
</ol>
<p>You must be at least 18 years old to use the Service.</p>
<p>You are responsible for maintaining the confidentiality of your account information.</p>
<ol start="3">
<li><strong> User Content</strong></li>
</ol>
<p>By using the Service, you grant Neonflake Enterprises (OPC) Pvt Ltd a non-exclusive license to use, reproduce, adapt, publish, translate, and distribute your user content.</p>
<ol start="4">
<li><strong> Prohibited Activities</strong></li>
</ol>
<p>You agree not to engage in any of the following activities:</p>
<ul>
<li>Violating laws or regulations.</li>
<li>Unauthorized access to other users' accounts.</li>
<li>Posting content that is harmful, threatening, or violates the rights of others.</li>
</ul>
<ol start="5">
<li><strong> Termination</strong></li>
</ol>
<p>Neonflake Enterprises (OPC) Pvt Ltd reserves the right to terminate or suspend your account at any time without prior notice for any reason.</p>
<ol start="6">
<li><strong> Changes to Terms</strong></li>
</ol>
<p>Neonflake Enterprises (OPC) Pvt Ltd reserves the right to modify or replace these Terms and Conditions at any time. Your continued use of the Service after any changes constitute acceptance of the new Terms.</p>
<ol start="7">
<li><strong> Limitation of Liability</strong></li>
</ol>
<p>Neonflake Enterprises (OPC) Pvt Ltd and its affiliates will not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the Service.</p>
<ol start="8">
<li><strong> Governing Law</strong></li>
</ol>
<p>These Terms and Conditions are governed by and construed in accordance with the laws of [Your Country], without regard to its conflict of law provisions.</p>
<ol start="9">
<li><strong> Contact Us</strong></li>
</ol>
<p>If you have any questions about these Terms and Conditions, please contact Neonflake Enterprises (OPC) Pvt Ltd at contact@leadesh.com.</p>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms And Conditions"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Html(data: data),
        ),
      ),
    );
  }
}
