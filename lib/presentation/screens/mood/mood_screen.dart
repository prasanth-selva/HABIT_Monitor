import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../home/widgets/week_calendar_strip.dart';
import 'widgets/mood_chart.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Mood', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Track today\'s mood and view trends.', style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
            const SizedBox(height: 24),
            WeekCalendarStrip(
              selectedDate: _selectedDate,
              onDateSelected: (date) {
                setState(() => _selectedDate = date);
              },
            ),
            const SizedBox(height: 24),
            const MoodChart(),
            const SizedBox(height: 24),
            
            _buildMoodCard(
              mood: 'Good',
              time: '09:39 PM',
              icon: Icons.sentiment_very_satisfied,
              color: AppColors.success,
              tags: ['Outdoors', 'Nature', 'Weather', 'Happiness'],
              note: 'Feeling Amazing after a Nature Walk',
            ),
            _buildMoodCard(
              mood: 'Bad',
              time: '09:40 PM',
              icon: Icons.sentiment_dissatisfied,
              color: AppColors.habitOrange,
              tags: ['Work', 'Productivity', 'Stress', 'Office'],
              note: 'A Bit Down - Missed a Deadline',
            ),
            _buildMoodCard(
              mood: 'Neutral',
              time: '09:40 PM',
              icon: Icons.sentiment_neutral,
              color: AppColors.skipped,
              tags: ['Creativity', 'Health', 'Home', 'Outdoors'],
              note: '',
            ),
            const SizedBox(height: 100), // spacing for nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildMoodCard({
    required String mood,
    required String time,
    required IconData icon,
    required Color color,
    required List<String> tags,
    required String note,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mood, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(t, style: const TextStyle(color: AppColors.textSecondary, fontSize: 10)),
            )).toList(),
          ),
          if (note.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text('Note: $note', style: const TextStyle(fontSize: 12, color: AppColors.text)),
          ]
        ],
      ),
    );
  }
}
