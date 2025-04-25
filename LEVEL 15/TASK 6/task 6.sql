SELECT p.patient_name, d.doctor_name, d.doctor_specialty
FROM Patients p
JOIN Admissions a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;