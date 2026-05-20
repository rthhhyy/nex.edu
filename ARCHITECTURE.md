# Architecture & Technical Design - nex.edu

## System Architecture

### High-Level Architecture
```
┌─────────────────────────────────────────────────────┐
│              Mobile App (Flutter)                   │
│  ┌──────────────────────────────────────────────┐  │
│  │  Presentation Layer (Screens & Widgets)      │  │
│  └──────────────────────────────────────────────┘  │
│           ↓                                         │
│  ┌──────────────────────────────────────────────┐  │
│  │  Business Logic Layer (Providers & Services) │  │
│  └──────────────────────────────────────────────┘  │
│           ↓                                         │
│  ┌──────────────────────────────────────────────┐  │
│  │  Data Layer (Firestore & Local Storage)      │  │
│  └──────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────────────────┐
│         Backend Services (Firebase)                 │
│  • Authentication                                   │
│  • Firestore Database                               │
│  • Cloud Storage                                    │
│  • Cloud Functions (future)                         │
└─────────────────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────────────────┐
│     AI/ML Services (FastAPI - Future Phase)        │
│  • Learning Pattern Analysis                        │
│  • Content Generation                               │
│  • Quiz Generation                                  │
│  • Recommendations Engine                           │
└─────────────────────────────────────────────────────┘
```

## Technology Stack

### Frontend
- **Framework**: Flutter 3.0+
- **Language**: Dart 3.0+
- **State Management**: Provider
- **UI Components**: Material Design 3
- **Animations**: Flutter Animate, Custom Animations
- **HTTP Client**: http package
- **Local Storage**: shared_preferences, sqlite

### Backend (Phase 2)
- **Framework**: FastAPI
- **Language**: Python 3.9+
- **Database**: Firebase Firestore
- **Authentication**: Firebase Auth
- **Storage**: Firebase Cloud Storage
- **AI/ML**: TensorFlow, Scikit-learn, NLP libraries

### Infrastructure
- **Hosting**: Firebase Hosting
- **Database**: Firestore
- **Authentication**: Firebase Authentication
- **Real-time**: Firebase Realtime Database
- **Notifications**: Firebase Cloud Messaging
- **Analytics**: Google Analytics for Firebase

## Data Models

### User Model
```dart
class User {
  final String uid;
  final String email;
  final String name;
  final String university;
  final String course;
  final String semester;
  final String goal;  // "learn", "understand", "teach", "project"
  final String learningStyle;  // "chapterwise", "markswise", "custom"
  final bool remindersEnabled;
  final TimeOfDay reminderTime;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

### Course Model
```dart
class Course {
  final String id;
  final String name;
  final String university;
  final String code;
  final List<Chapter> chapters;
  final String syllabus;  // URL or file path
  final int totalMarks;
  final DateTime createdAt;
}
```

### Chapter Model
```dart
class Chapter {
  final String id;
  final String courseId;
  final String name;
  final String description;
  final List<Topic> topics;
  final int marksWeightage;
  final String content;  // Markdown or HTML
  final List<String> keyPoints;
}
```

### Quiz Model
```dart
class Quiz {
  final String id;
  final String userId;
  final String courseId;
  final String chapterId;
  final List<Question> questions;
  final int? timeLimit;  // in minutes
  final double score;
  final int timeTaken;  // in seconds
  final DateTime completedAt;
  final List<String> toughTopics;
}
```

### Question Model
```dart
class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String explanation;
  final String difficulty;  // "easy", "medium", "hard"
  final String topic;
  final String? userAnswer;
  final bool isCorrect;
}
```

### Progress Model
```dart
class Progress {
  final String userId;
  final String courseId;
  final double syllabusCompletion;  // 0-100
  final int chaptersCompleted;
  final int totalChapters;
  final int quizzesTaken;
  final double averageScore;
  final List<String> toughTopics;
  final int totalStudyTime;  // in minutes
  final DateTime lastStudyDate;
  final Map<String, double> topicMastery;
}
```

## Key Features Implementation

### 1. Learning Pattern Recognition

**Algorithm**:
```
1. Collect user interactions:
   - Time spent on topics
   - Quiz performance
   - Re-attempts on questions
   - Navigation patterns

2. Analyze patterns:
   - Learning velocity
   - Preferred content type
   - Optimal study time
   - Retention rate

3. Generate recommendations:
   - Topic difficulty adjustment
   - Content format suggestions
   - Review schedule
   - Next best topic to learn
```

### 2. Tough Topics Tracking

**Logic**:
```dart
class ToughTopicTracker {
  // Mark topic as tough when user:
  // - Answers wrong 2+ times
  // - Skips the question
  // - Takes too long to answer
  
  void markAsTough(String topicId) {
    toughTopics[topicId] = {
      'markedAt': DateTime.now(),
      'count': (toughTopics[topicId]?.count ?? 0) + 1,
      'lastAppeared': DateTime.now(),
    };
  }
  
  void checkRemoval(String topicId) {
    // Remove from tough topics if:
    // - 4 quizzes completed without marking as tough
    // - User correctly answers 3 consecutive questions
    // - User confidence score is high
  }
}
```

### 3. Quiz Progression System

**Adaptive Difficulty**:
```
Initial Quiz (Assessment)
    ↓
[Performance Analysis]
    ↓
Easy Questions (if score < 40%)
Medium Questions (if 40% ≤ score < 70%)
Hard Questions (if score ≥ 70%)
    ↓
[Adjust based on answers]
    ↓
Next Quiz with Updated Difficulty
```

### 4. Progress Analytics

**Metrics Calculated**:
- Syllabus completion percentage
- Average quiz score
- Learning velocity (progress per week)
- Time spent per topic
- Topic mastery level (0-100%)
- Weak topics identification
- Consistency score
- Recommended study duration

## Animation System

### Animation Categories

#### 1. Entry Animations
- Fade + Slide: Pages and sections
- Scale: Interactive elements
- Rotation: Loading indicators

#### 2. Interaction Animations
- Ripple effect: Button clicks
- Color transition: Selection changes
- Bounce: Item selections

#### 3. Feedback Animations
- Green flash: Correct answer
- Red shake: Wrong answer
- Pulse: Important updates

#### 4. Micro Interactions
- Expand/Collapse: Accordion items
- Slide reveal: Swipe actions
- Rotate: Expand indicators

## Performance Optimization

### Memory Management
```dart
// Use const constructors
const SizedBox(height: 20)

// Dispose resources
@override
void dispose() {
  _controller.dispose();
  _subscription.cancel();
  super.dispose();
}

// Use StreamBuilder for efficient rebuilds
StreamBuilder<T>(
  stream: myStream,
  builder: (context, snapshot) {},
)
```

### UI Optimization
- Use `ListView.builder` for long lists
- Implement `RepaintBoundary` for expensive widgets
- Use `shouldRebuild` for conditional rebuilds
- Lazy load images with `cached_network_image`

### Database Optimization
- Index frequently queried fields
- Use pagination for large datasets
- Cache frequently accessed data
- Batch operations when possible

## Security Considerations

### Data Protection
- Encrypt sensitive data at rest
- Use HTTPS for all communications
- Implement Firebase Security Rules
- Validate input on both client and server

### User Privacy
- Minimal data collection
- User consent for tracking
- GDPR compliance
- Data deletion options

### Content Protection
- Screenshot prevention
- Copy protection
- Download restrictions
- Watermarking (future)

## Testing Strategy

### Unit Tests
- Provider logic
- Data models
- Utility functions
- Service methods

### Widget Tests
- Screen rendering
- User interactions
- State changes
- Error handling

### Integration Tests
- Complete user flows
- Firebase integration
- Navigation
- Performance

## Deployment Pipeline

### Development
1. Code on feature branch
2. Local testing
3. Push to GitHub
4. Create PR

### Staging
1. PR review
2. Merge to develop branch
3. Build APK/IPA
4. Internal testing

### Production
1. Version bump
2. Tag release
3. Build release APK/IPA
4. Submit to Play Store & App Store
5. Monitor crashes and analytics

## Future Scalability

### Phase 2: Backend Integration
- FastAPI backend
- Advanced AI/ML models
- Recommendation engine
- Content generation pipeline

### Phase 3: Social Features
- User profiles
- Leaderboards
- Group study
- Discussion forums

### Phase 4: Advanced Features
- Video lectures
- Interactive simulations
- AR/VR content
- Adaptive testing

---

**Last Updated**: May 2026
**Version**: 1.0.0
