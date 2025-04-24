import streamlit as st
import numpy as np
import joblib

# Load the trained RF model
model = joblib.load('model2_churn_model.pkl')  

# App Title
st.title(" Client Plus – Churn Prediction App")

# Sidebar Inputs
st.sidebar.header("Enter Customer Details:")

total_trans_ct = st.sidebar.number_input("Total Transactions (12 Months)", min_value=0, value=50)
engagement_score = st.sidebar.slider("Engagement Score", 0.0, 5.0, value=3.0, step=0.1)
total_trans_amt = st.sidebar.number_input("Total Transaction Amount", min_value=0, value=120000)
avg_monthly_trans_amt = st.sidebar.number_input("Avg Monthly Transaction Amount", min_value=0, value=9000)
avg_open_to_buy = st.sidebar.number_input("Available Credit (Open to Buy)", min_value=0, value=45000)

# Predict Button
if st.sidebar.button("Predict Churn"):
    input_data = np.array([[total_trans_ct, engagement_score, total_trans_amt, avg_monthly_trans_amt, avg_open_to_buy]])
    prediction = model.predict(input_data)
    proba = model.predict_proba(input_data)[0][1]  # Probability of churn

    st.subheader(" Prediction Result:")
    if proba >= 0.6:
        st.error(f" Customer Likely to Churn (Probability: {proba:.2f})")
    else:
        st.success(f" Customer Likely to Stay (Probability: {1 - proba:.2f})")

    # Add feedback tooltip
    st.sidebar.markdown(" Model Tip")
    st.sidebar.info("Higher engagement, more transactions, and healthy open credit typically reduce churn risk.")
