json.extract! employee, :id, :is_active, :identification, :identification_type, :birth_date, :balance, :created_at, :updated_at
json.url employee_url(employee, format: :json)