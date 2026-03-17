Project: AI Life OS (Cross-Platform Privacy-First Mobile App)

Vision:
Build a next-generation AI-powered personal assistant app that helps users manage finances, detect scams, track behavior, and remember commitments — with strong focus on privacy (on-device processing).

Platform Strategy:

* Phase 1: iOS MVP (for testing)
* Phase 2: Android full-feature version
* Phase 3: Cross-device sync

---

## CORE PRINCIPLES

* Privacy-first: all processing on-device by default
* Do NOT store raw sensitive data (SMS, audio, full emails)
* Store only structured insights
* Encrypted local database
* Modular architecture

---

## PHASE 1 (MVP) – iOS APP

Build an iOS app using Swift + SwiftUI.

IMPORTANT:

* iOS restrictions apply: NO SMS, NO call logs, NO WhatsApp access
* Use only allowed sources

---

## FEATURE 1 (IMPLEMENT NOW)

Financial Data Intelligence Engine (iOS adapted)

Data Sources:

1. Gmail Integration (OAuth)

   * Read only financial emails (bank, UPI alerts, credit card, receipts)
   * Do not store raw emails

2. PDF Upload

   * User uploads bank/credit card statement
   * Extract transactions

3. Manual Entry (optional)

   * Add income/expense
   * Add EMI/subscription

---

## DATA PROCESSING

Extract:

* amount
* date/time
* type (credit/debit)
* merchant / counterparty
* category

Store ONLY structured data (no raw text)

Example schema:
{
id,
datetime,
type,
amount,
merchant,
category,
source
}

---

## FEATURES (MVP UI)

1. Dashboard

   * Monthly income
   * Monthly expense
   * Net balance

2. Transactions List

3. Insights

   * Top spending categories
   * Top merchants

4. Basic Search

   * “Last month expense”

---

## STORAGE

* Use CoreData / SQLite
* Encrypt database
* Offline-first

---

## PRIVACY

* On-device processing
* No external data sharing
* Clear permission explanation

---

## DELIVERABLE (PHASE 1)

* iOS TestFlight build
* Gmail connected
* PDF parsing working
* Dashboard functional

---

## PHASE 2 – ANDROID (FULL POWER)

Build Android version using Kotlin.

Add:

* SMS reading
* UPI detection
* Notification parsing
* Call analysis
* Scam detection

---

## ADMIN PANEL (WEB)

Build a web-based admin panel (React + Node.js backend).

Features:

1. User Management

   * List all users
   * Device info
   * Plan type
   * Last active
   * Search & filter
   * Export CSV

2. Pricing Management

   * Create/edit/delete plans
   * Monthly price (₹)
   * Feature access per plan

3. Metrics Dashboard

   * Total users
   * Active users
   * Conversion rate
   * Revenue estimate

---

## REVENUE MODEL

Implement:

1. Free Plan

   * Basic features

2. Paid Plans (admin configurable)

   * Basic (₹99/month)
   * Pro (₹199/month)
   * Family (₹399/month)

3. Subscription system (in-app purchase ready)

---

## ARCHITECTURE

Frontend:

* iOS: SwiftUI
* Android: Kotlin

Backend:

* Node.js + Express
* PostgreSQL

Security:

* JWT auth
* Encrypted storage

---

## IMPORTANT RULES

* DO NOT access restricted iOS data
* DO NOT upload sensitive data
* KEEP app lightweight
* PRIORITIZE clean UI

---

## START IMPLEMENTATION

Step 1:
Build iOS MVP (Feature 1 only)

Step 2:
Deliver TestFlight build for testing

---

## GOAL

Create a working iOS app that:

* Connects Gmail
* Parses financial data
* Shows insights

This will be tested on a real iPhone device.

---

## END
