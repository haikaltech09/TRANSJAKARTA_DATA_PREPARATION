SELECT 
    u.user_id,
    u.name AS user_name,
    u.email,
    u.phone AS user_phone,

    c.card_id,
    c.card_number,
    c.balance,
    c.status AS card_status,
    c.issued_at,

    t.transaction_id,
    t.fare,

    s.schedule_id,
    s.departure_time,
    s.arrival_time,

    r.route_id,
    r.route_name,
    r.start_point,
    r.end_point,
    r.distance_km,

    st.stop_id,
    st.name AS stop_name,
    st.location AS stop_location,
    st.is_terminal,

    b.bus_id,
    b.plate_number,
    b.model AS bus_model,
    b.capacity,
    b.status AS bus_status,

    d.driver_id,
    d.name AS driver_name,
    d.license_number,
    d.phone AS driver_phone,
    d.status AS driver_status,

    i.incident_id,
    i.description AS incident_description,
    i.reported_at,
    i.severity,
    i.resolved

FROM users u
JOIN cards c ON u.user_id = c.user_id
JOIN transactions t ON c.card_id = t.card_id
JOIN schedules s ON t.schedule_id = s.schedule_id
JOIN routes r ON s.route_id = r.route_id
JOIN stops st ON s.stop_id = st.stop_id
JOIN buses b ON s.bus_id = b.bus_id
JOIN drivers d ON s.driver_id = d.driver_id
LEFT JOIN incidents i ON i.schedule_id = s.schedule_id;


/*JOIN dari semua tabel penting: users, cards, transactions, schedules, routes, stops, buses, drivers, dan incidents.

Menggunakan LEFT JOIN pada incidents supaya tetap tampil meskipun tidak semua jadwal ada insidennya.

Data ini sudah lengkap untuk analisis: penumpang, kartu, jadwal, rute, bus, sopir, transaksi, dan insiden.*/