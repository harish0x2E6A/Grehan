# Grehan — Technical Retrospective (Sanitized)

**Status:** Educational / sanitized — runtime memory-manipulation (C++) components removed.  
**Short:** Client app (Lua) + plain PHP server (MySQL) demonstrating per-device key authentication, single-device verification, and server-driven update distribution (mocked).

---

## Table of Contents
- [Summary](#summary)
- [Tech stack](#tech-stack)
- [Repository layout](#repository-layout)
- [System architecture](#system-architecture)
- [Database schema (example)](#database-schema-example)
- [API endpoints (example)](#api-endpoints-example)
- [Auth & key lifecycle (technical)](#auth--key-lifecycle-technical)
- [Update distribution (technical, conceptual)](#update-distribution-technical-conceptual)
- [Mock/demo mode & how to run](#mockdemo-mode--how-to-run)
- [Security, privacy, and ethical notes](#security-privacy-and-ethical-notes)
- [Development & maintenance notes](#development--maintenance-notes)
- [License & contact](#license--contact)

---

## Summary
Grehan began as a combined client-native and server-driven system. The original client included a C++ native component that performed runtime memory reads/writes; that component is intentionally omitted. This repository contains the Lua client layer, a plain PHP server showing the auth/update endpoints, MySQL examples, and docs to explain the architecture and lessons learned.

---

## Tech stack
- Client: **Lua** (scripting layer / UI wrapper)
- Server: **Plain PHP** (procedural PHP endpoints, no framework)
- Database: **MySQL**
- Transport: HTTP(S) for API calls (client → server)
- Build (original native part): **C++** (omitted)

---

## Repository layout
