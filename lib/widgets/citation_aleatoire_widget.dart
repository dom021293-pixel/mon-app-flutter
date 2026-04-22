// lib/widgets/citation_aleatoire_widget.dart
import 'package:flutter/material.dart';
import 'package:joe/models/citation_saint_model.dart';

class CitationAleatoireWidget extends StatefulWidget {
  @override
  _CitationAleatoireWidgetState createState() => _CitationAleatoireWidgetState();
}

class _CitationAleatoireWidgetState extends State<CitationAleatoireWidget> {
  late CitationSaint _citation;

  @override
  void initState() {
    super.initState();
    _citation = CitationsSaintsData.getAleatoire();
  }

  void _nouvelleCitation() {
    setState(() {
      _citation = CitationsSaintsData.getAleatoire();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.brown.shade300,
              Colors.brown.shade600,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.format_quote,
                    color: Colors.white,
                    size: 30,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: _nouvelleCitation,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                '"${_citation.texte}"',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(_citation.imageUrl),
                    onBackgroundImageError: (_, __) {},
                  ),
                  SizedBox(width: 8),
                  Text(
                    '- ${_citation.saint}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                _citation.reference,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}