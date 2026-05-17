# nex.edu - AI-Powered Learning Platform

## 📚 Overview

**nex.edu** is a comprehensive AI-powered educational platform designed to revolutionize how students learn. The app leverages artificial intelligence to understand individual learning patterns, adapt content delivery, and provide personalized educational experiences.

### 🎯 Core Philosophy
*"Sky is the limit!"* - Indrajith

We believe every student has unlimited potential. Our platform is built to:
- Understand how each student learns best
- Adapt to individual learning patterns and paces
- Provide intelligent, personalized recommendations
- Make learning engaging, interactive, and effective

---

## ✨ Key Features

### 1️⃣ **Intelligent Onboarding System**
- **University Selection** - Choose from 50+ institutions
- **Course Selection** - Pick your subject/engineering branch
- **Semester/Year Selection** - Select your current study level
- **Syllabus Auto-Loading** - Fetch syllabus from web with dual verification
- **Manual Upload** - Upload custom syllabus PDFs if needed

### 2️⃣ **Goal-Based Learning**
Users can select their learning objective:
- 📖 **To Learn** - Acquire new knowledge and skills
- 🧠 **To Understand** - Deep comprehension of concepts
- 👨‍🏫 **To Teach** - Prepare to explain topics to others
- 🔧 **For Project** - Project or professional reference

### 3️⃣ **Personalized Learning Paths**
- **Chapter-wise Learning** - Organized by syllabus units
- **Marks-wise Learning** - Prioritized by exam weightage
- **Custom Topics** - Choose specific topics to focus on

### 4️⃣ **AI-Powered Quiz System**
- 📊 **Initial Assessment Quiz** - Evaluates learning patterns and knowledge gaps
- ⏱️ **Timed Quizzes** - Time-based challenges with analytics
- 📈 **Performance Tracking** - Monitor improvements after 5th quiz
- ✅ **Adaptive Difficulty** - Questions adjust based on performance
- 🎯 **Weak Topic Identification** - AI identifies and marks tough topics

### 5️⃣ **Smart Tough Topics Management**
- 🚩 Mark questions as "Tough" when wrong or skipped
- 📚 Receive simplified, AI-generated explanations
- 🔄 Automatic removal from "Tough" section after 4 appearances without marking
- 📊 Progress visualization for difficult topics

### 6️⃣ **Study Timer & Pomodoro**
- ⏲️ Customizable Pomodoro sessions (25 min focus, 5 min break)
- 📝 Key points generator for each study session
- 🎯 Session-based mini-quizzes
- 📊 Study time analytics and trends

### 7️⃣ **Smart Notifications & Reminders**
- 🔔 Customizable study reminders
- ⏰ Time-based notifications
- 📬 Progress update alerts
- 🎯 Milestone celebrations

### 8️⃣ **Advanced Analytics & Progress Tracking**
- 📊 **Learning Progress** - Topics covered, understanding level
- 📈 **Syllabus Completion** - Visual progress bars
- 🎓 **Performance Analytics** - Quiz scores, improvement trends
- 🔍 **Deep Insights** - Weak areas, strong areas, learning velocity
- 📉 **Graphical Representations** - Charts, graphs, and visualizations

### 9️⃣ **Content Protection & Subscription**
- 🔒 **Screenshot Prevention** - Secure study notes
- ❌ **Copy Protection** - Prevent content copying
- ⬇️ **Premium Downloads** - Download notes (subscription-based)
- 🔐 **Security Features** - Protect intellectual property

### 🔟 **Multi-Language Support**
- 🌍 Translate notes to 50+ languages
- 🎤 Audio explanations in multiple languages
- 🔤 Font size and reading mode customization

### 1️⃣1️⃣ **AI-Generated Content**
- 🎨 Automatic diagram generation (similar to GPT/Claude)
- 📊 Graph and chart creation
- 📝 Simplified note generation
- 🔍 Concept explanation in simple terms

### 1️⃣2️⃣ **Beautiful Animations**
- ✨ Smooth fade & slide transitions
- 🎯 Scale animations on interactions
- 💫 Loading spinners and progress animations
- 🌈 Color-coded animations for right/wrong answers

---

## 🎨 Design System

### Color Palette (Inspired by Euphoria Series)
```
Primary Color:     #8B0000 (Deep Red)
Secondary Color:   #DC143C (Crimson)
Accent Color:      #FFD700 (Gold)
Dark Background:   #0A0E27 (Deep Purple-Black)
Card Background:   #1A1F3A (Dark Blue-Purple)
Success:           #00D991 (Neon Green)
Warning:           #FF6B6B (Red)
Text Light:        #E0E0E0 (Light Gray)
```

### Typography
- **Font Family**: Poppins (Modern & Clean)
- **Display Large**: 32px Bold
- **Title Large**: 20px SemiBold
- **Body Large**: 16px Regular
- **Body Medium**: 14px Regular

---

## 🏗️ Project Architecture

### **Frontend Structure (Flutter)**
```
lib/
├── main.dart
├── screens/
│   ├── auth/
│   │   └── login_screen.dart
│   ├── onboarding/
│   │   ├── university_selection_screen.dart
│   │   ├── course_selection_screen.dart
│   │   ├── semester_selection_screen.dart
│   │   └── syllabus_loading_screen.dart
│   └── dashboard/
│       ├── goal_selection_screen.dart
│       ├── learning_preference_screen.dart
│       ├── reminder_preference_screen.dart
│       ├── home_dashboard.dart
│       ├── study_screen.dart
│       ├── quiz_screen.dart
│       ├── progress_screen.dart
│       └── tough_topics_screen.dart
├── widgets/
│   ├── animations/
│   │   ├── fade_slide_animation.dart
│   │   └── scale_animation.dart
│   ├── quiz/
│   │   └── quiz_card.dart
│   └── progress/
│       └── progress_chart.dart
├── providers/
│   ├── auth_provider.dart
│   ├── user_provider.dart
│   ├── course_provider.dart
│   ├── quiz_provider.dart
│   └── progress_provider.dart
├── services/
│   ├── firestore_service.dart
│   ├── auth_service.dart
│   └── quiz_service.dart
├── models/
│   ├── user.dart
│   ├── course.dart
│   ├── quiz.dart
│   └── progress.dart
├── theme/
│   └── app_theme.dart
└── utils/
    ├── constants.dart
    └── validators.dart
```

### **Backend Structure (FastAPI - Future Phase)**
```
app/
├── main.py
├── api/
│   ├── auth.py
│   ├── courses.py
│   ├── quizzes.py
│   ├── progress.py
│   └── ai_service.py
├── models/
│   ├── user.py
│   ├── course.py
│   └── quiz.py
├── services/
│   ├── firestore_service.py
│   ├── ai_service.py
│   └── nlp_service.py
├── schemas/
│   └── schemas.py
└── config/
    └── settings.py
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0+ 
- Dart 3.0+
- Firebase Account
- Python 3.9+ (for backend)

### Installation

#### 1. Clone Repository
```bash
git clone https://github.com/rthhhyy/nex.edu.git
cd nex.edu
```

#### 2. Flutter Setup
```bash
flutter pub get
flutter pub upgrade
```

#### 3. Firebase Configuration
- Create Firebase project at https://console.firebase.google.com
- Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- Place in respective directories

#### 4. Run Application
```bash
# Development
flutter run

# Production
flutter run --release
```

---

## 📱 Screen Flow

```
Login Screen
    ↓
University Selection
    ↓
Course Selection
    ↓
Semester Selection
    ↓
Syllabus Loading (with dual verification)
    ↓
Goal Selection (Learn/Understand/Teach/Project)
    ↓
Learning Preference (Chapter-wise/Marks-wise/Custom)
    ↓
Reminder Preferences
    ↓
Home Dashboard (Study/Quiz/Progress/Account)
    ↓
Initial Assessment Quiz
    ↓
Personalized Learning Path
```

---

## 🎯 Feature Implementation Roadmap

### Phase 1 (Current - Sprint 1-2)
- [x] Authentication & Onboarding
- [x] Goal & Preference Selection
- [x] UI/UX with Animations
- [ ] Firestore Integration
- [ ] Initial Assessment Quiz

### Phase 2 (Sprint 3-4)
- [ ] Study Timer & Pomodoro
- [ ] Content Protection
- [ ] Quiz System with AI
- [ ] Progress Analytics

### Phase 3 (Sprint 5-6)
- [ ] AI Content Generation
- [ ] Multi-language Support
- [ ] Advanced Analytics
- [ ] Subscription System

### Phase 4 (Sprint 7+)
- [ ] Backend FastAPI Integration
- [ ] AI/ML Models
- [ ] Social Features
- [ ] Advanced Notifications

---

## 🔐 Data Security

- All data encrypted in transit (HTTPS)
- Firestore security rules
- User authentication via Firebase Auth
- Screenshot and copy protection
- Secure local storage with encryption

---

## 📊 Analytics Tracked

- Study sessions duration
- Quiz performance and improvements
- Learning pattern analysis
- Topic mastery levels
- Time spent per chapter
- Strong vs weak topics
- Learning velocity
- Retention rates

---

## 🎮 Gamification Elements

- 🏆 Achievement badges
- 🔥 Streak counters
- ⭐ Performance ratings
- 🎁 Milestone rewards
- 🏅 Leaderboard (future)

---

## 🌐 API Documentation

### Firestore Collections

#### Users Collection
```json
{
  "uid": "user_id",
  "email": "user@example.com",
  "name": "User Name",
  "university": "IIT Delhi",
  "course": "Computer Science",
  "semester": "Semester 1",
  "goal": "To Learn",
  "learningStyle": "Chapter-wise",
  "remindersEnabled": true,
  "reminderTime": "09:00",
  "createdAt": "timestamp",
  "updatedAt": "timestamp"
}
```

#### Quizzes Collection
```json
{
  "id": "quiz_id",
  "userId": "user_id",
  "chapter": "Chapter Name",
  "questions": [
    {
      "id": "q1",
      "question": "What is..?",
      "options": ["A", "B", "C", "D"],
      "correctAnswer": "A",
      "difficulty": "medium"
    }
  ],
  "score": 85,
  "timeTaken": 1200,
  "completedAt": "timestamp"
}
```

#### Progress Collection
```json
{
  "userId": "user_id",
  "syllabusCompletion": 65,
  "chaptersCompleted": 5,
  "totalChapters": 8,
  "quizzesTaken": 12,
  "averageScore": 78.5,
  "toughTopics": ["Topic 1", "Topic 2"],
  "lastStudyDate": "timestamp"
}
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

All rights reserved © 2026 - nex.edu

---

## 👨‍💻 Creator

**Created by: Indrajith**
- *"sky is the limit!"*
- Instagram: [@i_ndr.grhm](https://instagram.com/i_ndr.grhm)
- All rights reserved 2026

---

## 📞 Support

For issues, questions, or suggestions:
- Open a GitHub Issue
- Contact via Instagram @i_ndr.grhm
- Email: indrajith@nexedu.com

---

## 🙏 Acknowledgments

- Flutter & Dart community
- Firebase platform
- Design inspiration from Euphoria series color palette
- Audemars Piguet design aesthetic

---

**Happy Learning! 🚀**
