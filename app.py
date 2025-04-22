import streamlit as st
import joblib
import numpy as np

# Load the trained model
model = joblib.load("churn_model.pkl")

# App title
st.title("Client Plus – Churn Prediction")

# Sidebar for user input
st.sidebar.header("Enter Customer Metrics")

# Input fields
trans_ct = st.sidebar.number_input("Total Transactions (Last 12 Months)", min_value=0, max_value=500, step=1)
engagement = st.sidebar.slider("Engagement Score (0 to 1)", min_value=0.0, max_value=1.0, value=0.5)
trans_amt = st.sidebar.number_input("Total Transaction Amount", min_value=0.0)
monthly_amt = st.sidebar.number_input("Avg Monthly Transaction Amount", min_value=0.0)
open_to_buy = st.sidebar.number_input("Average Open to Buy", min_value=0.0)

# Prediction
if st.sidebar.button("Predict Churn"):
    input_data = np.array([[trans_ct, engagement, trans_amt, monthly_amt, open_to_buy]])
    prediction = model.predict(input_data)
    
    result = " Customer Will Churn" if prediction[0] == 1 else " Customer Will Stay"
    st.subheader("Prediction Result:")
    st.success(result)