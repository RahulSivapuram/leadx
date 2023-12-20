import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:leadx/constants.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  final String data = """ <p><strong>Terms and Conditions</strong></p>
<p><strong>Last Updated:</strong> December 13, 2023</p>

<ol>
  <li><strong>Acceptance of Terms</strong>
    <p>By accessing or using the Leadesh mobile application (the "Service"), you agree to comply with and be bound by these Terms and Conditions. If you disagree with any part of the terms, you may not access the Service.</p>
  </li>

  <li><strong>Use of the Service</strong>
    <p>You must be at least 18 years old to use the Service.</p>
    <p>You are responsible for maintaining the confidentiality of your account information.</p>
  </li>

  <li><strong>User Content</strong>
    <p>By using the Service, you grant Neonflake Enterprises (OPC) Pvt Ltd a non-exclusive license to use, reproduce, adapt, publish, translate, and distribute your user content.</p>
  </li>

  <li><strong>Prohibited Activities</strong>
    <p>You agree not to engage in any of the following activities:</p>
    <ul>
      <li>Violating laws or regulations.</li>
      <li>Unauthorized access to other users' accounts.</li>
      <li>Posting content that is harmful, threatening, or violates the rights of others.</li>
    </ul>
  </li>

  <li><strong>Termination</strong>
    <p>Neonflake Enterprises (OPC) Pvt Ltd reserves the right to terminate or suspend your account at any time without prior notice for any reason.</p>
  </li>

  <li><strong>Changes to Terms</strong>
    <p>Neonflake Enterprises (OPC) Pvt Ltd reserves the right to modify or replace these Terms and Conditions at any time. Your continued use of the Service after any changes constitute acceptance of the new Terms.</p>
  </li>

  <li><strong>Limitation of Liability</strong>
    <p>Neonflake Enterprises (OPC) Pvt Ltd and its affiliates will not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the Service.</p>
  </li>

  <li><strong>Governing Law</strong>
    <p>These Terms and Conditions are governed by and construed in accordance with the laws of [Your Country], without regard to its conflict of law provisions.</p>
  </li>

  <li><strong>Contact Us</strong>
    <p>If you have any questions about these Terms and Conditions, please contact Neonflake Enterprises (OPC) Pvt Ltd at contact@leadesh.com.</p>
  </li>
</ol>
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Constants().draw(context, Constants().number1),
      appBar: AppBar(
        title: const Text("Terms And Conditions"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Html(data: data),
        ),
      ),
    );
  }
}
