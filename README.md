# 🖼️ Photo Sorter OCI

A lightweight Flask web application that uses InsightFace to automatically sort photos into folders based on reference images.

This project is optimized to run as a client-server app on Oracle Cloud Infrastructure (OCI) or any Linux server with Python 3.10+ support.

---

## ✨ Features

- Upload reference images ("who to detect")
- Upload inbox photos ("to be sorted")
- Automatically detects, compares, and sorts photos by person
- Real-time logging via Flask-SocketIO
- Web-based interface (no command line needed)
- Audit trail and revert scripts for undoing file sorting
- Compatible with CPU or GPU (CUDA) devices

---

## 📁 Project Structure

photo-sorter-oci/
│
├── app.py # Main Flask backend
├── templates/index.html # Web UI frontend
├── photo_sorter/ # Core face recognition logic
│ └── init.py, helpers...
├── download_model.sh # Download InsightFace model
├── requirements.txt # Python dependencies
├── Dockerfile # For containerized deployment (optional)
├── render.yaml # Optional render config (unused on OCI)
├── runtime.txt # Optional Python version pin
├── .gitignore
└── README.md


---

## 🚀 Quick Start (Local)

```bash
# Clone the repo
git clone https://github.com/<your_username>/photo-sorter-oci.git
cd photo-sorter-oci

# Setup virtual environment
python3.10 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Download the model
bash download_model.sh

# Run the app
python app.py


## Deployment on Oracle VM (OCI)

This app can be hosted on an Ubuntu-based Compute Instance (VM):
Install Python 3.10 and dependencies
Clone this repo
Set up and activate a virtual environment
Run python app.py
Use NGINX or Oracle Firewall to open port 5000 to the public

