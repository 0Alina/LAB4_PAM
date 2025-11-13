import 'package:flutter/material.dart';
import '../domain/models/featured_service.dart';

class FeaturedServicesWidget extends StatelessWidget {
  final List<FeaturedService> services;
  const FeaturedServicesWidget({super.key, required this.services});

  Widget _buildServiceCard(FeaturedService service) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          service.image,
          height: 220,
          width: 180,
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => Container(color: Colors.grey, child: const Icon(Icons.image)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text("Featured Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Spacer(),
            Text("View all >", style: TextStyle(fontSize: 14, color: Colors.teal, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: services.map((s) => _buildServiceCard(s)).toList(),
          ),
        ),
      ],
    );
  }
}
