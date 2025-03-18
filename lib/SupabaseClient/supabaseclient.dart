import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientInstance {
  static final SupabaseClient supabase = SupabaseClient(
    'https://pjiqytbtcvixsxiswtiz.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqaXF5dGJ0Y3ZpeHN4aXN3dGl6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYxNzY4MDMsImV4cCI6MjA1MTc1MjgwM30.dOMzNgEzzEjoyZctQfwy05qhPyB232cf2EouvaVklgw',
  );
}
