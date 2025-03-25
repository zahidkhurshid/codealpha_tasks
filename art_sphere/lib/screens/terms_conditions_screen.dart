import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[900]!, Colors.blue[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to ArtSphere! By using our app, you agree to comply with the following terms and conditions. If you do not agree, please do not use our services.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  '1. Account Registration',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• You must provide accurate and complete information when creating an account.\n'
                  '• You are responsible for maintaining the security of your account.\n'
                  '• Users must be at least 13 years old (or the minimum required age in their country).',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '2. Content Ownership & Usage',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• Artists retain full ownership of the artwork they upload.\n'
                  '• By uploading content, you grant ArtSphere a non-exclusive, royalty-free license to display your artwork within the app for promotional purposes.\n'
                  '• Users may not download, reproduce, or use artwork without the artist permission.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '3. Prohibited Content',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• Do not upload content that is hateful, violent, illegal, sexually explicit, or infringing on others rights.\n'
                  '• AI-generated or plagiarized artwork must be properly disclosed.\n'
                  '• We reserve the right to remove any content violating these rules.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '4. Community Guidelines',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• Be respectful when engaging with other users.\n'
                  '• Do not spam, harass, or impersonate others.\n'
                  '• Any abusive behavior may result in a permanent ban.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '5. Monetization & Payments (If Applicable)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• ArtSphere provides a platform for selling artwork, but we do not handle payments directly.\n'
                  '• Transactions are managed through third-party payment processors (e.g., Stripe, PayPal).\n'
                  '• ArtSphere is not responsible for disputes between buyers and sellers.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '6. Intellectual Property Rights',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• Do not upload content that you do not have the rights to.\n'
                  '• Copyright violations will be taken seriously, and repeated offenses may result in account termination.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '7. Limitation of Liability',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• ArtSphere is not liable for any loss, damage, or misuse of uploaded content.\n'
                  '• We do not guarantee uninterrupted or error-free service.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '8. Termination of Service',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• We reserve the right to suspend or delete accounts violating our policies.\n'
                  '• Users may delete their accounts at any time.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '9. Changes to Terms & Conditions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '• We may update these Terms & Conditions at any time. Continued use of ArtSphere after changes means you accept the updated terms.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  '10. Contact Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'For any questions or concerns, please contact us at artsphere@gmail.com.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
