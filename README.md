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

```
photo-sorter-oci/
│
├── app.py                    # Main Flask backend
├── templates/index.html      # Web UI frontend
├── photo_sorter/             # Core face recognition logic
│   └── __init__.py, helpers...
├── download_model.sh         # Download InsightFace model
├── requirements.txt          # Python dependencies
├── Dockerfile                # For containerized deployment (optional)
├── render.yaml               # Optional render config (unused on OCI)
├── runtime.txt               # Optional Python version pin
├── .gitignore
└── README.md
```

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
```

Then visit: `http://localhost:5000` in your browser.

---

## 🐳 Docker Support (optional)

```bash
# Build the container
docker build -t photo-sorter .

# Run it
docker run -p 5000:5000 photo-sorter
```

---

## ☁️ Deployment on Oracle VM (OCI)

This app can be hosted on an Ubuntu-based Compute Instance (VM):

1. SSH into your instance
2. Install Python 3.10 and system dependencies:
    ```bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y python3.10 python3.10-venv python3.10-dev python3-pip git
    ```

3. Clone this repo:
    ```bash
    git clone https://github.com/<your_username>/photo-sorter-oci.git
    cd photo-sorter-oci
    ```

4. Setup and activate a virtual environment:
    ```bash
    python3.10 -m venv venv
    source venv/bin/activate
    ```

5. Install Python packages:
    ```bash
    pip install --upgrade pip
    pip install -r requirements.txt
    ```

6. Download the model:
    ```bash
    bash download_model.sh
    ```

7. Run the application:
    ```bash
    python app.py
    ```

8. Access via your VM's public IP:
    ```
    http://<your-oracle-vm-ip>:5000
    ```

Make sure port 5000 is open in OCI security rules.

---

## 🔐 OCI Notes

- Use `.pem` SSH key to connect from your Cloud Shell
- Your app runs on port 5000 → add Ingress Rule for TCP 5000
- You may add NGINX later for reverse proxy

---

## 🧪 Health Check

You can test the setup with:
- `curl http://localhost:5000`
- uploading test reference + inbox photos
- monitoring logs in console

---

## 🧠 Tips

- Tune InsightFace threshold for better sorting
- Use `uploads/` folder to store reference + inbox photos
- Logs are saved in `logs/` folder
- Enable debug in `app.py` if needed

---

## 📜 License

MIT License – use it freely, modify it, improve it!

---

## 👤 Author

Made with ❤️ by [@aaayyysss](https://github.com/aaayyysss)
