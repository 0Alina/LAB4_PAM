import 'package:flutter/material.dart';
import '../domain/models/medicine.dart';

class MedicinesWidget extends StatefulWidget {
  final List<Medicine> medicines;
  const MedicinesWidget({super.key, required this.medicines});

  @override
  State<MedicinesWidget> createState() => _MedicinesWidgetState();
}

class _MedicinesWidgetState extends State<MedicinesWidget> {
  late List<bool> _favorites;

  @override
  void initState() {
    super.initState();
    _favorites = List<bool>.filled(widget.medicines.length, false);
  }

  Widget _buildMedicineCard(Medicine medicine, int index) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 9 : 7, right: 7),
      child: Stack(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    medicine.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(medicine.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(medicine.dosage, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(medicine.price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              Text(medicine.unit, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(color: const Color(0xFF357A7B), borderRadius: BorderRadius.circular(6)),
                            child: const Center(child: Icon(Icons.add, color: Colors.white, size: 20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _favorites[index] = !_favorites[index];
                });
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4, offset: const Offset(0, 2))],
                ),
                child: Icon(_favorites[index] ? Icons.favorite : Icons.favorite_border, color: _favorites[index] ? Colors.redAccent : Colors.grey),
              ),
            ),
          ),
        ],
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
            Text("Medicines", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Spacer(),
            Text("View all >", style: TextStyle(fontSize: 14, color: Colors.teal, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(widget.medicines.length, (index) => _buildMedicineCard(widget.medicines[index], index)),
          ),
        ),
      ],
    );
  }
}
