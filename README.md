# 📋 AttendTrack – Attendance Management System

A full-featured employee attendance management system built with PHP, MySQL, HTML, and CSS. Ready to deploy to shared hosting.

---

## ✨ Features

### Employee Features
- ✅ **Geo-verified Check-In** — captures GPS coordinates on check-in
- 📸 **Photo Proof** — selfie capture for every check-in/out
- ✅ **Check-Out** with geo + photo
- ⏰ **Overtime Check-In/Out** with separate geo + photo capture
- 📋 Personal attendance history with map links
- 👤 Profile management (username, email, password, photo)

### Admin Features
- 📊 **Enhanced Dashboard** — real-time stats, charts (Chart.js)
- 👥 **User Management** — create, edit, activate/deactivate, delete users
- 📑 **Reports** — filter by date range and employee
- ⬇️ **Export CSV** — Excel-compatible UTF-8 with BOM
- ⬇️ **Export Excel (.xls)** — HTML-table format Excel opens natively
- 📍 **Map Links** — click to view any location in Google Maps

### Auth Features
- 🔐 **Login** with show/hide password toggle (eye icon)
- 📝 **Register** with password strength indicator
- 🔑 **Forgot Password** with secure token-based reset
- ⏱ **Session timeout** (1 hour, configurable)

---

## 🚀 Deployment to Shared Hosting

### Requirements
- PHP 7.4 or higher (PHP 8.x recommended)
- MySQL 5.7+ or MariaDB 10.3+
- Extensions: `pdo_mysql`, `gd`, `fileinfo`

### Step 1: Upload Files
Upload all files to your hosting via FTP/cPanel File Manager.
Place in `public_html/` (root) or a subdirectory like `public_html/attendance/`.

### Step 2: Configure Database
Edit `config.php`:
```php
define('DB_HOST', 'localhost');
define('DB_NAME', 'your_database_name');
define('DB_USER', 'your_db_username');
define('DB_PASS', 'your_db_password');
define('APP_URL',  'https://yourdomain.com');        // No trailing slash
define('TIMEZONE', 'Asia/Jakarta');                  // Your timezone
```

### Step 3: Create Database
- In cPanel → MySQL Databases: create a new database and user
- Grant the user ALL privileges on the database

### Step 4: Run Installer
Visit: `https://yourdomain.com/install.php`
Click **Install Now**.

### Step 5: Delete Installer (Security!)
After installation, **delete `install.php`** from your server.

### Step 6: Log In
- URL: `https://yourdomain.com/index.php`
- Admin: `admin` / `Admin@123`
- **⚠️ Change the admin password immediately!**

---

## 📁 File Structure

```
attendance-app/
├── config.php              ← DB config & session setup
├── functions.php           ← All helper functions
├── index.php               ← Login page
├── register.php            ← User registration
├── forgot-password.php     ← Password reset
├── logout.php              ← Session destroy
├── dashboard.php           ← User attendance dashboard
├── profile.php             ← User profile settings
├── install.php             ← DB installer (delete after use)
├── .htaccess               ← Apache security rules
├── admin/
│   ├── index.php           ← Admin dashboard + charts
│   ├── users.php           ← User management CRUD
│   └── reports.php         ← Reports + CSV/Excel export
├── api/
│   └── attendance.php      ← JSON API for check-in/out
├── assets/
│   └── css/
│       └── style.css       ← Main stylesheet
├── includes/
│   └── nav.php             ← Shared navigation/sidebar
└── uploads/                ← Photo storage (auto-created)
    └── .htaccess           ← Protects uploads directory
```

---

## 🔧 Configuration Options

In `config.php`:

| Constant        | Default              | Description                    |
|----------------|----------------------|--------------------------------|
| `DB_HOST`       | `localhost`          | MySQL host                     |
| `DB_NAME`       | `attendance_db`      | Database name                  |
| `DB_USER`       | `root`               | Database username               |
| `DB_PASS`       | *(empty)*            | Database password               |
| `APP_URL`       | `http://localhost/…` | Full URL to app (no trailing /) |
| `SESSION_TIMEOUT` | `3600`             | Session timeout in seconds      |
| `TIMEZONE`      | `Asia/Jakarta`       | PHP timezone                   |

---

## 🗄️ Database Schema

### `users`
| Column       | Type                    |
|-------------|-------------------------|
| id          | INT UNSIGNED PRIMARY KEY|
| username    | VARCHAR(60) UNIQUE      |
| email       | VARCHAR(120) UNIQUE     |
| password    | VARCHAR(255) (bcrypt)   |
| role        | ENUM('user','admin')    |
| phone       | VARCHAR(30)             |
| department  | VARCHAR(80)             |
| profile_pic | VARCHAR(200)            |
| is_active   | TINYINT(1)              |
| created_at  | DATETIME                |

### `attendance`
| Column            | Type              |
|------------------|-------------------|
| id               | INT UNSIGNED PK   |
| user_id          | FK → users.id     |
| work_date        | DATE              |
| checkin_time     | TIME              |
| checkin_lat/lng  | DECIMAL(10,7)     |
| checkin_photo    | VARCHAR(200)      |
| checkout_*       | same pattern      |
| ot_checkin_*     | same pattern      |
| ot_checkout_*    | same pattern      |
| status           | ENUM              |

### `password_resets`
| Column     | Type           |
|-----------|----------------|
| id        | INT UNSIGNED PK|
| email     | VARCHAR(120)   |
| token     | VARCHAR(100)   |
| created_at| DATETIME       |

---

## 📧 Email Integration (Optional)

Currently, `forgot-password.php` displays the reset link on screen (for demo/testing). To send real emails, add an email function in `functions.php`:

```php
function sendResetEmail($email, $token) {
    $link = APP_URL . '/forgot-password.php?token=' . $token;
    $subject = 'Password Reset – ' . APP_NAME;
    $body = "Click this link to reset your password:\n$link\n\nLink expires in 1 hour.";
    mail($email, $subject, $body, 'From: noreply@yourdomain.com');
}
```

Then call it in `createResetToken()`.

---

## 🔒 Security Notes

- All passwords are bcrypt hashed
- SQL injection prevention via PDO prepared statements
- XSS prevention via `htmlspecialchars()`
- Session timeout enforced server-side
- Uploads protected via `.htaccess` (images only, no directory listing)
- CSRF protection: add CSRF tokens for production hardening
- Admin routes require `requireAdmin()` check

---

## 📱 Mobile Support
The interface is fully responsive and camera capture works on mobile devices using the device's front camera (`facingMode: 'user'`).

---

## 🎨 Customization
- Primary color: change `--primary` in `assets/css/style.css`
- App name: change `APP_NAME` in `config.php`
- Timezone: change `TIMEZONE` in `config.php`
- Session timeout: change `SESSION_TIMEOUT` in `config.php`

---

*Built with PHP, MySQL, HTML5, CSS3, JavaScript (no frameworks required)*
