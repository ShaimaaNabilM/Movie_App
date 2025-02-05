// class CastsModel {
//   final int id;
//   final String profilePath;
//   final String name;

//   CastsModel({
//     required this.id,
//     required this.profilePath,
//     required this.name,
//   });

//   factory CastsModel.fromJson(Map<String, dynamic> json) {
//     return CastsModel(
//       id: json['id'],
//       profilePath: json['profile_path'] != null 
//   ? 'https://image.tmdb.org/t/p/w500${json['profile_path']}' 
//   : 'https://images.app.goo.gl/GVTCUgP96gTPNeLr7',   // القيمة الافتراضية إذا كانت null
//       name: json['name'] ?? 'Unknown Cast', // القيمة الافتراضية إذا كانت null
//     );
//   }
// }
