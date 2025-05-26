import 'package:flutter/material.dart';

class PengambilanObatPage extends StatefulWidget {
  const PengambilanObatPage({Key? key}) : super(key: key);

  @override
  State<PengambilanObatPage> createState() => _PengambilanObatPageState();
}

class _PengambilanObatPageState extends State<PengambilanObatPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String selectedUKS = 'UKS Utama';
  DateTime selectedDate = DateTime.now();
  String selectedTime = '08:00';

  // Data UKS yang tersedia
  final List<Map<String, dynamic>> daftarUKS = [
    {
      'nama': 'UKS Utama',
      'lokasi': 'Gedung A, Lantai 1',
      'petugas': 'Dr. Sarah Wijaya',
      'jamBuka': '07:00 - 15:00',
      'status': 'Buka',
      'telepon': '(021) 123-4567',
    },
    {
      'nama': 'UKS ke 2',
      'lokasi': 'Gedung B, Lantai 2',
      'petugas': 'Ns. Budi Santoso',
      'jamBuka': '07:30 - 14:00',
      'status': 'Buka',
      'telepon': '(021) 123-4568',
    },
    {
      'nama': 'UKS ke 3',
      'lokasi': 'Gedung C, Lantai 1',
      'petugas': 'Ns. Sari Indah',
      'jamBuka': '08:00 - 15:30',
      'status': 'Tutup',
      'telepon': '(021) 123-4569',
    },
  ];

  // Data obat yang tersedia
  final List<Map<String, dynamic>> daftarObat = [
    {
      'nama': 'Paracetamol',
      'dosis': '500mg',
      'stok': 50,
      'kategori': 'Demam & Nyeri',
      'icon': Icons.medication,
      'tersedia': true,
    },
    {
      'nama': 'Antasida',
      'dosis': '200mg',
      'stok': 30,
      'kategori': 'Pencernaan',
      'icon': Icons.local_pharmacy,
      'tersedia': true,
    },
    {
      'nama': 'Betadine',
      'dosis': '10ml',
      'stok': 15,
      'kategori': 'Antiseptik',
      'icon': Icons.healing,
      'tersedia': true,
    },
    {
      'nama': 'Vitamin C',
      'dosis': '100mg',
      'stok': 0,
      'kategori': 'Vitamin',
      'icon': Icons.spa,
      'tersedia': false,
    },
    {
      'nama': 'Plester',
      'dosis': '5cm x 5cm',
      'stok': 25,
      'kategori': 'Perawatan Luka',
      'icon': Icons.medical_services,
      'tersedia': true,
    },
  ];

  // Data jadwal pengambilan
  final List<String> jamTersedia = [
    '08:00', '08:30', '09:00', '09:30', '10:00', '10:30',
    '11:00', '11:30', '13:00', '13:30', '14:00', '14:30'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
                leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Color(0xFF14482F)),
    onPressed: () {
      Navigator.pushNamed(context, ('/home')); // kembali ke halaman sebelumnya
    },
  ),
        title: const Text(
          'Pengambilan Obat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF14482F),
          ),
        ),
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFF14482F),
          labelColor: Color(0xFF14482F),
          unselectedLabelColor: Color.fromARGB(255, 37, 120, 80),
          tabs: const [
            Tab(text: 'Lokasi UKS'),
            Tab(text: 'Jadwal'),
            Tab(text: 'Daftar Obat'),
          ],
        ),
      ),
      
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLokasiUKSTab(),
          _buildJadwalTab(),
          _buildDaftarObatTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAjukanPengambilanDialog(context);
        },
        backgroundColor: const Color(0xFF14482F),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Ajukan Pengambilan',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLokasiUKSTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Lokasi UKS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: daftarUKS.length,
              itemBuilder: (context, index) {
                final uks = daftarUKS[index];
                final isSelected = selectedUKS == uks['nama'];
                final isOpen = uks['status'] == 'Buka';

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: isSelected ? 4 : 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isSelected 
                            ? const Color(0xFF14482F) 
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: isOpen ? () {
                        setState(() {
                          selectedUKS = uks['nama'];
                        });
                      } : null,
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: isOpen 
                                        ? const Color(0xFF14482F).withOpacity(0.1)
                                        : Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.local_hospital,
                                    color: isOpen 
                                        ? const Color(0xFF14482F)
                                        : Colors.grey,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            uks['nama'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: isOpen 
                                                  ? Colors.grey[800]
                                                  : Colors.grey[500],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: isOpen 
                                                  ? Colors.green[100]
                                                  : Colors.red[100],
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              uks['status'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: isOpen 
                                                    ? Colors.green[700]
                                                    : Colors.red[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        uks['lokasi'],
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF14482F),
                                    size: 24,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildInfoRow(Icons.person, 'Petugas', uks['petugas']),
                            const SizedBox(height: 8),
                            _buildInfoRow(Icons.access_time, 'Jam Buka', uks['jamBuka']),
                            const SizedBox(height: 8),
                            _buildInfoRow(Icons.phone, 'Telepon', uks['telepon']),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJadwalTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Jadwal Pengambilan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          
          // Pilihan Tanggal
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Pengambilan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF14482F)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF14482F),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _formatDate(selectedDate),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF14482F),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Pilihan Jam
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jam Pengambilan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: jamTersedia.map((jam) {
                      final isSelected = selectedTime == jam;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTime = jam;
                          });
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected 
                                ? const Color(0xFF14482F)
                                : Colors.white,
                            border: Border.all(
                              color: const Color(0xFF14482F),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            jam,
                            style: TextStyle(
                              color: isSelected 
                                  ? Colors.white
                                  : const Color(0xFF14482F),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Info Jadwal Terpilih
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF14482F).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF14482F).withOpacity(0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jadwal Terpilih:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF14482F),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_formatDate(selectedDate)} pukul $selectedTime',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF14482F),
                  ),
                ),
                Text(
                  'Lokasi: $selectedUKS',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaftarObatTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Obat Tersedia',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: daftarObat.length,
              itemBuilder: (context, index) {
                final obat = daftarObat[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: obat['tersedia']
                                  ? const Color(0xFF14482F).withOpacity(0.1)
                                  : Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              obat['icon'],
                              color: obat['tersedia']
                                  ? const Color(0xFF14482F)
                                  : Colors.grey,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  obat['nama'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: obat['tersedia']
                                        ? Colors.grey[800]
                                        : Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${obat['dosis']} • ${obat['kategori']}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.inventory,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Stok: ${obat['stok']}',
                                      style: TextStyle(
                                        color: obat['stok'] > 0 
                                            ? Colors.green[600]
                                            : Colors.red[600],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: obat['tersedia']
                                  ? Colors.green[100]
                                  : Colors.red[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              obat['tersedia'] ? 'Tersedia' : 'Habis',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: obat['tersedia']
                                    ? Colors.green[700]
                                    : Colors.red[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF14482F),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  void _showAjukanPengambilanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajukan Pengambilan Obat'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Detail Pengambilan:'),
              const SizedBox(height: 12),
              _buildDetailItem('Lokasi', selectedUKS),
              _buildDetailItem('Tanggal', _formatDate(selectedDate)),
              _buildDetailItem('Jam', selectedTime),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Obat yang Dibutuhkan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Keterangan (Opsional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pengajuan pengambilan obat berhasil dikirim!'),
                  backgroundColor: Color(0xFF14482F),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF14482F),
              foregroundColor: Colors.white,
            ),
            child: const Text('Ajukan'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}