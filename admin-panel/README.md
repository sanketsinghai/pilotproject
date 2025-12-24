# Admin Panel - Digamber Jain App

Simple admin dashboard for managing temples, Granths, Munis, Dharamshalas, and pathshala lessons.

## Setup

```bash
# Install Streamlit
pip install streamlit firebase-admin pandas

# Run admin panel
streamlit run app.py

# Access at http://localhost:8501
```

## Features

- **Authentication**: Firebase Admin Auth
- **Content Management**: CRUD operations for all entities
- **Data Visualization**: Stats, charts, analytics
- **Bulk Upload**: CSV import for temples/dharamshalas
- **User Management**: View users, ban/activate accounts
- **Analytics**: Traffic, app usage, popular content

## File Structure

```
admin-panel/
├── app.py                 # Main Streamlit app
├── requirements.txt       # Dependencies
├── pages/
│   ├── 1_Temples.py
│   ├── 2_Granths.py
│   ├── 3_Dharamshalas.py
│   ├── 4_Munis.py
│   ├── 5_Pathshala.py
│   ├── 6_Users.py
│   └── 7_Analytics.py
└── utils/
    ├── firestore_utils.py
    └── validators.py
```

## Deploy on Streamlit Cloud

```bash
# Push to GitHub, then:
# 1. Go to https://share.streamlit.io
# 2. Connect GitHub account
# 3. Select repository and app.py
# 4. Deploy (free hosting)
```
