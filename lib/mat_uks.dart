import 'package:flutter/material.dart';
import 'package:myhealth/custom_bottom_navbar.dart';

class UKSPage extends StatefulWidget {
  const UKSPage({super.key});

  @override
  State<UKSPage> createState() => _UKSPageState();
}

class _UKSPageState extends State<UKSPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'UKS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF14482F),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Berita UKS'),
            Tab(text: 'Materi UKS'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/jadwal');
              break;
            case 2:
              Navigator.pushNamed(context, '/profil');
              break;
            case 3:
              Navigator.pushNamed(context, '/obat');
              break;
            case 4:
              Navigator.pushNamed(context, '/riwayat');
              break;
          }
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          UKSNewsTab(),
          UKSMaterialTab(),
        ],
      ),
    );
  }
}

class UKSNewsTab extends StatelessWidget {
  const UKSNewsTab({super.key});

  final List<Map<String, dynamic>> newsData = const [
    {
      'title': 'Program Vaksinasi COVID-19 untuk Pelajar Dimulai',
      'date': '21 Mei 2025',
      'summary': 'Kementerian Kesehatan bekerjasama dengan Kemendikbud meluncurkan program vaksinasi COVID-19 khusus untuk pelajar SMA/SMK.',
      'category': 'Vaksinasi',
      'image': 'vaccine',
      'isImportant': true,
    },
    {
      'title': 'Tips Menjaga Kesehatan Mental Siswa',
      'date': '20 Mei 2025',
      'summary': 'Panduan lengkap untuk guru dan orang tua dalam mendukung kesehatan mental siswa di era digital.',
      'category': 'Kesehatan Mental',
      'image': 'mental_health',
      'isImportant': false,
    },
    {
      'title': 'Peluncuran Aplikasi UKS Digital',
      'date': '19 Mei 2025',
      'summary': 'Aplikasi baru untuk monitoring kesehatan siswa secara digital telah diluncurkan di 500 sekolah pilot.',
      'category': 'Teknologi',
      'image': 'app',
      'isImportant': true,
    },
    {
      'title': 'Pelatihan Kader UKS Se-Indonesia',
      'date': '18 Mei 2025',
      'summary': 'Program pelatihan nasional untuk meningkatkan kapasitas kader UKS dalam memberikan pelayanan kesehatan.',
      'category': 'Pelatihan',
      'image': 'training',
      'isImportant': false,
    },
    {
      'title': 'Kampanye Hidup Sehat di Sekolah',
      'date': '17 Mei 2025',
      'summary': 'Gerakan nasional untuk membudayakan pola hidup sehat di lingkungan sekolah melalui berbagai kegiatan edukatif.',
      'category': 'Kampanye',
      'image': 'healthy_life',
      'isImportant': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header berita utama
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF14482F), Color(0xFF1B5A3A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.newspaper, color: Colors.white, size: 30),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Berita Terkini UKS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Informasi terbaru seputar Unit Kesehatan Sekolah',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 20),
          
          // Daftar berita
          ...newsData.map((news) => _buildNewsCard(news)).toList(),
        ],
      ),
    );
  }

  Widget _buildNewsCard(Map<String, dynamic> news) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: () {
            // Handle news tap - bisa navigasi ke detail berita
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: news['isImportant'] ? Colors.red[100] : Color(0xFF14482F).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        news['category'],
                        style: TextStyle(
                          color: news['isImportant'] ? Colors.red[700] : Color(0xFF14482F),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (news['isImportant'])
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'PENTING',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    const Spacer(),
                    Text(
                      news['date'],
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  news['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF14482F),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  news['summary'],
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.visibility, size: 16, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text('Baca selengkapnya', style: TextStyle(color: Color(0xFF14482F), fontSize: 12, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey[400]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UKSMaterialTab extends StatelessWidget {
  const UKSMaterialTab({super.key});

  final List<Map<String, dynamic>> materialData = const [
    {
      'title': 'Panduan Pertolongan Pertama di Sekolah',
      'description': 'Langkah-langkah dasar pertolongan pertama yang harus dikuasai oleh setiap anggota komunitas sekolah.',
      'type': 'PDF Guide',
      'duration': '15 menit',
      'level': 'Dasar',
      'icon': Icons.healing,
      'color': Colors.red,
    },
    {
      'title': 'Cara Menarik Perhatian Princess UKS',
      'description': 'Tutorial mendapatkan hati sang Princess UKS.',
      'type': 'Video Tutorial',
      'duration': '20 menit',
      'level': 'Menengah',
      'icon': Icons.monitor_heart,
      'color': Colors.blue,
    },
    {
      'title': 'Pengelolaan Obat-obatan UKS',
      'description': 'Sistem penyimpanan, pencatatan, dan distribusi obat-obatan di Unit Kesehatan Sekolah.',
      'type': 'Modul',
      'duration': '30 menit',
      'level': 'Lanjutan',
      'icon': Icons.medication,
      'color': Colors.green,
    },
    {
      'title': 'Deteksi Dini Masalah Kesehatan Siswa',
      'description': 'Cara mengenali gejala awal penyakit dan masalah kesehatan yang sering dialami siswa.',
      'type': 'Checklist',
      'duration': '25 menit',
      'level': 'Menengah',
      'icon': Icons.search,
      'color': Colors.orange,
    },
    {
      'title': 'Kesehatan Reproduksi Remaja',
      'description': 'Materi edukasi kesehatan reproduksi yang sesuai untuk remaja usia sekolah.',
      'type': 'Presentasi',
      'duration': '45 menit',
      'level': 'Lanjutan',
      'icon': Icons.favorite,
      'color': Colors.pink,
    },
    {
      'title': 'Program Gizi Sekolah',
      'description': 'Panduan menerapkan program gizi seimbang dan monitoring status gizi siswa.',
      'type': 'Handbook',
      'duration': '35 menit',
      'level': 'Menengah',
      'icon': Icons.restaurant,
      'color': Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header materi
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF14482F), Color(0xFF1B5A3A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.school, color: Colors.white, size: 30),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Materi Pembelajaran UKS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Koleksi lengkap materi dan panduan UKS',
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 20),

          // Filter level
          Row(
            children: [
              _buildFilterChip('Semua', true),
              SizedBox(width: 8),
              _buildFilterChip('Dasar', false),
              SizedBox(width: 8),
              _buildFilterChip('Menengah', false),
              SizedBox(width: 8),
              _buildFilterChip('Lanjutan', false),
            ],
          ),
          
          SizedBox(height: 20),
          
          // Grid materi
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 16,
              childAspectRatio: 3.5,
            ),
            itemCount: materialData.length,
            itemBuilder: (context, index) {
              return _buildMaterialCard(materialData[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF14482F) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

Widget _buildMaterialCard(Map<String, dynamic> material) {
  return Card(
    elevation: 2,
    shadowColor: Colors.grey.withOpacity(0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      onTap: () {
        // Handle material tap - bisa navigasi ke detail materi
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(12), // Reduced from 16
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10), // Reduced from 12
              decoration: BoxDecoration(
                color: material['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                material['icon'],
                color: material['color'],
                size: 22, // Reduced from 24
              ),
            ),
            const SizedBox(width: 16), // Reduced from 16
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Important: minimize column size
                children: [
                  Text(
                    material['title'],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF14482F),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3), // Reduced from 5
                  Text(
                    material['description'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 9,
                      height: 1.1, // Reduced line height
                    ),
                    maxLines: 1, // Reduced from 2 to save space
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5), // Reduced from 3
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), // Reduced vertical padding
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          material['type'],
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 8, // Reduced from 9
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4), // Reduced from 5
                      Icon(Icons.access_time, size: 10, color: Colors.grey[500]), // Reduced size
                      const SizedBox(width: 2),
                      Text(
                        material['duration'],
                        style: TextStyle(color: Colors.grey[500], fontSize: 8),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), // Reduced vertical padding
                        decoration: BoxDecoration(
                          color: _getLevelColor(material['level']).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          material['level'],
                          style: TextStyle(
                            color: _getLevelColor(material['level']),
                            fontSize: 8, // Reduced from 9
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6), // Reduced from 8
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]), // Reduced size
          ],
        ),
      ),
    ),
  );
}

Color _getLevelColor(String level) {
  switch (level) {
    case 'Dasar':
      return Colors.green;
    case 'Menengah':
      return Colors.orange;
    case 'Lanjutan':
      return Colors.red;
    default:
      return Colors.grey;
  }
}
}
