class HiveTableConstant {
  // Private constructor to prevent instantiation
  HiveTableConstant._();

  static const String dbName = "jobmitra_db";

  //we do the indexing for each table for faster searching and querying 

  static const int employerTypeId = 0;
  static const String employerTable = "employer_table";

  static const int recruiterTypeId = 1;
  static const String recruiterTable = "recruiter_table";
}
