#  Secure Data Transfer and Deletion using Counting Bloom Filter (CBF) in Cloud Computing

A Java-based cloud security project for **secure data transfer**, **verifiable deletion**, and **CBF-based presence tracking**.

---

## 📚 Abstract

In modern cloud storage, secure transfer and guaranteed deletion of sensitive data remain critical. This project leverages **Counting Bloom Filters (CBF)** to verify data presence, manage deletion verifiability, and avoid high memory overhead. Encryption (AES + SHA) secures transfers, while logs and user interfaces ensure full transparency.
This project implements:

- **Counting Bloom Filter (CBF)** for memory-efficient data tracking.
- **AES + SHA encryption** for secure file transfers and integrity.
- **User-friendly interface** for uploading, verifying, and deleting files.
- **Compliance** with privacy regulations using verifiable deletion.

---

## 🛠️ Tech Stack

| Layer      | Tools Used                        |
|------------|-------------------------------    |
| Frontend   | HTML, CSS (Bootstrap), JavaScript |
| Backend    | Java (JSP, Servlets)              |
| Database   | MySQL                             |
| Server     | Apache Tomcat                     |
| Encryption | AES (128-bit), SHA-512            |
| Logic Core | Java Collections Framework (CBF)  |

---

## 🚀 Key Features

- ✅ **Secure Uploads** – Encrypted using AES before cloud migration.
- 🔍 **CBF Verification** – Verify existence/deletion of files securely.
- 📦 **Simulated Cloud Storage** – Upload and manage data.
- 🔐 **User Login System** – Basic user authentication.
- 🗑️ **Verifiable Deletion** – Track deleted file status.
- 📊 **Logs & Reports** – View and export system actions.

---

## 🔐 Encryption & Security

- 🔒 AES for **data confidentiality**
- 🧮 SHA-512 for **filename hashing and integrity**
- 🌐 Counting Bloom Filter for **efficient memory usage**
- ✅ GDPR-compliant **"Right to Erasure"** enforcement

---

## 🧭 Project Workflow

Step-by-step working of the **Secure Data Transfer and Deletion Using Counting Bloom Filter (CBF)** system.

### 1️⃣ User Login & Session Start

- Users visit the login page and enter credentials.
- Credentials are validated via a Servlet using a database query.

- Upon success, the session is started and the user is redirected to the dashboard

### 2️⃣ File Upload with Encryption

- Users navigate to the Upload interface.
- Actions performed:
  - 🔐 **AES Encryption** for file content.
  - 🧮 **SHA-512 Hashing** for filenames.
- Encrypted file is saved in `/cloud_storage/`.
- File metadata (name, hash, timestamp) stored in **MySQL**.
- File hash is inserted into the **Counting Bloom Filter (CBF)**.
- A log entry is created to track upload events.

### 3️⃣ Verifying File Presence

- User enters filename for verification.
- System:
  - Hashes the filename.
  - Checks it in the CBF.
- Results:
  - ✅ **All bits non-zero** → Possibly Present
  - ❌ **Any bit zero** → Definitely Not Present

### 4️⃣ File Download *(Optional)*

- User selects a file to download.
- The file is:
  - Decrypted using the same **AES** key.
  - Returned as a download.
- A **download log** is created.

### 5️⃣ Secure Deletion Process

- User selects a file to delete.
- System:
  - Deletes encrypted file from storage.
  - Decrements corresponding CBF counters.
  - Removes metadata from the database.
  - Logs the deletion event.
- ✅ Ensures **verifiable deletion** (GDPR Article 17 compliance).

### 6️⃣ Logs & Audit Trail

- View logs of:
  - 📤 Uploads
  - 🗑️ Deletions
  - 🔍 CBF Verifications
  - 🔐 Login Sessions
- Logs are saved in:
  - MySQL 


### 7️⃣ Logout

- On logout:
  - Session is invalidated.
  - User is redirected to `login.jsp`.

---

## 📈 Flow Diagram

![ChatGPT Image Jun 11, 2025, 02_58_41 PM](https://github.com/user-attachments/assets/4e5d6e29-1546-47bd-a1e9-e5beab0f90af)


## 🖼️ Website Images


![Screenshot (213)](https://github.com/user-attachments/assets/cea15b94-ebb4-4a4f-8e30-faa0f5df4f0f)

![Screenshot (231)](https://github.com/user-attachments/assets/dc64ff5a-da88-49aa-a30e-196f7950db4d)

![Screenshot (215)](https://github.com/user-attachments/assets/81b801ec-7e0a-4056-8790-e78e69d72b7c)

![Screenshot (216)](https://github.com/user-attachments/assets/82f001c1-d782-4d61-9bd9-d24c9fd430a6)

![Screenshot (217)](https://github.com/user-attachments/assets/1d834502-5f09-4c5d-bac5-a2da4cecf19f)

![Screenshot (227)](https://github.com/user-attachments/assets/daa630e1-c248-41e8-b715-b6a1168872d8)

![Screenshot (232)](https://github.com/user-attachments/assets/c7c93d16-47cb-4add-8238-34c3e9cc7fb2)

![Screenshot (234)](https://github.com/user-attachments/assets/48b32863-a588-4005-bf36-0ce6a28ed281)

![Screenshot (233)](https://github.com/user-attachments/assets/a36d73b0-e562-456d-be86-65875bb020e0)

![Screenshot (229)](https://github.com/user-attachments/assets/e820e838-132a-4781-b44e-148b7391dce5)

![Screenshot (228)](https://github.com/user-attachments/assets/0267c3af-1abf-48e5-ab93-142e5dced51b)





---

## ⚙️ Setup Instructions
1. Clone the repo
2. Import project in Eclipse/IntelliJ
3. Configure Tomcat Server & MySQL
4. Run the project


## 🙋‍♂️ Author

**Somesh Pyla**  
📚 B.Tech in CSE, Acharya Nagarjuna University  
🌐 GitHub: https://github.com/someshpyla  
📩 Email: `someshpyla30@gmail.com` 

---
