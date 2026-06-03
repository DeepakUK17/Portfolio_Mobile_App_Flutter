import 'package:flutter/material.dart';

import '../models/achievement.dart';
import '../models/certificate.dart';
import '../models/contact_link.dart';
import '../models/education.dart';
import '../models/project.dart';
import '../utils/app_constants.dart';

class PortfolioData {
  const PortfolioData._();

  static const String headline =
      'AI & Data Science student skilled in Full-Stack development.';

  static const String summary =
      'I build user-friendly websites, Python projects, and AI-driven solutions '
      'that solve practical problems.';

  static const String about =
      'I am Deepak U. K., a Full-Stack Developer and AI & Data Science '
      'enthusiast with a strong foundation in computer science and web '
      'technologies. I am currently pursuing my B.Tech in Artificial '
      'Intelligence and Data Science at Karpagam Academy of Higher Education. '
      'As the Secretary of the ISTE Student Chapter and a member of AIQubit, I '
      'actively contribute to tech events, workshops, and collaborative '
      'projects. I enjoy creating projects that blend creativity with technology.';

  static const String profileImage = '${AppConstants.imagesPath}/photo.jpeg';

  static const List<String> roles = [
    'Full Stack Developer',
    'Programmer',
    'Web Designer',
    'ISTE Secretary',
    'Problem Solver',
  ];

  static const Map<String, List<String>> skills = {
    'Full-Stack': [
      'HTML',
      'CSS',
      'JavaScript',
      'Bootstrap',
      'React',
      'Django',
      'Flask',
      'SQL',
    ],
    'Others': ['Python', 'Git', 'GitHub', 'VS Code', 'Excel', 'Firebase'],
  };

  static const List<Project> projects = [
    Project(
      title: 'SkillBridge',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/skill bridge.png',
      skills: ['React', 'Supabase', 'Vite', 'CSS', 'TypeScript'],
      githubUrl: 'https://github.com/DeepakUK17/Skill-Bridge',
      liveDemoUrl: 'https://skillbridge-deepak.netlify.app/',
      description:
          'A web platform that connects skilled volunteers with NGOs for '
          'meaningful opportunities. It includes role-based dashboards, '
          'opportunity management, and real-time messaging.',
    ),
    Project(
      title: 'Call Drop Analyzer',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/call drop analyzer.png',
      skills: ['Python', 'Hugging Face Transformers', 'Streamlit', 'LangChain'],
      githubUrl: 'https://github.com/DeepakUK17/call_drop_analyzer.git',
      description:
          'An AI agent system that uses a Retrieval-Augmented Generation '
          'pipeline to analyze telecom logs and answer network performance '
          'questions.',
    ),
    Project(
      title: 'Certificate Generator',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/gendrator.png',
      skills: ['HTML', 'CSS', 'JavaScript', 'Flask', 'Python'],
      githubUrl: 'https://github.com/DeepakUK17/certificate-generator',
      liveDemoUrl: 'https://deepakuk17.github.io/certificate-generator/',
      description:
          'A web tool for uploading a certificate template, adding participant '
          'details, previewing results, and downloading personalized '
          'certificates.',
    ),
    Project(
      title: 'Certificate Search Portal',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/distrubutor.png',
      skills: ['HTML', 'CSS', 'JavaScript', 'Python', 'JSON'],
      githubUrl: 'https://github.com/DeepakUK17/Certificate-Search-Portal',
      liveDemoUrl: 'https://deepakuk17.github.io/Certificate-Search-Portal/',
      description:
          'A GitHub Pages certificate distribution system where users can enter '
          'a team ID, find matching certificates, and download certificate '
          'images.',
    ),
    Project(
      title: 'Clock Timer',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/clock.png',
      skills: ['HTML', 'CSS', 'JavaScript', 'Firebase', 'Realtime Database'],
      githubUrl: 'https://github.com/DeepakUK17/Clock-Timer',
      liveDemoUrl: 'https://hackspora.web.app/',
      description:
          'A synchronized countdown timer for events with multi-device sync, '
          'custom stages, and persistent timing.',
    ),
    Project(
      title: 'Canteen Food Pre-Ordering System',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/canteen app.png',
      skills: ['HTML', 'CSS', 'JavaScript', 'Bootstrap', 'Django', 'MySQL'],
      githubUrl: 'https://github.com/DeepakUK17/canteen-app',
      description:
          'A Django canteen management platform with authentication, order '
          'scheduling, stock management, and PDF receipt generation.',
    ),
    Project(
      title: 'Dashboard',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/excel.png',
      skills: ['Excel'],
      githubUrl: 'https://github.com/DeepakUK17/Dashboard.git',
      description:
          'An interactive Excel dashboard that visualizes student performance, '
          'attendance, demographics, charts, and key metrics.',
    ),
    Project(
      title: 'Personal Expense Tracker',
      year: '2025',
      imagePath: '${AppConstants.imagesPath}/python.png',
      skills: ['Python'],
      githubUrl: 'https://github.com/DeepakUK17/Personal-Expense-Tracker.git',
      description:
          'A Python tool for logging, viewing, categorizing, and analyzing '
          'expenses using CSV files.',
    ),
    Project(
      title: 'PassCrack',
      year: '2024',
      imagePath: '${AppConstants.imagesPath}/passcrack.png',
      skills: ['HTML', 'CSS', 'JavaScript'],
      githubUrl: 'https://github.com/DeepakUK17/PassCrack',
      liveDemoUrl: 'https://deepakuk17.github.io/passcrack/',
      description:
          'A password strength checker that analyzes passwords in real time and '
          'gives improvement feedback.',
    ),
  ];

  static const List<Certificate> certificates = [
    Certificate(
      title: 'Foundations of User Experience (UX) Design',
      issuer: 'Google (Coursera)',
      date: '2025',
      imagePath:
          '${AppConstants.certificatesPath}/Coursera UX by Google-page-00001.jpg',
    ),
    Certificate(
      title: 'AngularJS for Beginners: Getting Started',
      issuer: 'Coursera Project Network',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/Coursera AngularJS.jpg',
    ),
    Certificate(
      title: 'Universal Human Values Workshop',
      issuer: 'AICTE',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/UHV WORKSHOP.jpg',
    ),
    Certificate(
      title: 'E-Business',
      issuer: 'NPTEL (IIT Kharagpur)',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/NPTEL E-Business .jpg',
    ),
    Certificate(
      title: 'Enhancing Soft Skills and Personality',
      issuer: 'NPTEL (IIT Kanpur)',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/NPTEL Soft Skills .jpg',
    ),
    Certificate(
      title: 'Full Stack Web Development Internship',
      issuer: 'Pantech e Learning',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/pantech.jpg',
    ),
    Certificate(
      title: 'Angular Web Developer Certification',
      issuer: 'Infosys Springboard',
      date: '2025',
      imagePath:
          '${AppConstants.certificatesPath}/Angular Web Developer Certification.png',
    ),
    Certificate(
      title: 'Internet of Things',
      issuer: 'Infosys Springboard',
      date: '2025',
      imagePath:
          '${AppConstants.certificatesPath}/Internet of Things_pages-to-jpg-0001.jpg',
    ),
    Certificate(
      title: 'Data Structures and Algorithms (Part 1)',
      issuer: 'Infosys Springboard',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/1742883839961.jpeg',
    ),
    Certificate(
      title: 'Data Structures and Algorithms (Part 2)',
      issuer: 'Infosys Springboard',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/1742883850136.jpeg',
    ),
    Certificate(
      title: 'Problem Solving (Basic)',
      issuer: 'HackerRank',
      date: '2024',
      imagePath: '${AppConstants.certificatesPath}/1727882987185.jpeg',
    ),
    Certificate(
      title: 'Python (Basic)',
      issuer: 'HackerRank',
      date: '2024',
      imagePath: '${AppConstants.certificatesPath}/1727883320420.jpeg',
    ),
    Certificate(
      title: 'Basics of Python',
      issuer: 'UniAthena',
      date: '2025',
      imagePath:
          '${AppConstants.certificatesPath}/Deepak_CR641_certificate_pages-to-jpg-0001.jpg',
    ),
    Certificate(
      title: 'Python Programming',
      issuer: 'Kaggle',
      date: '2022',
      imagePath: '${AppConstants.certificatesPath}/DEEPAK U K - Python.png',
    ),
    Certificate(
      title: 'Agile Scrum in Practice',
      issuer: 'Infosys Springboard',
      date: 'June 5, 2025',
      imagePath: '${AppConstants.certificatesPath}/Agile Scrum in Practice.jpg',
    ),
    Certificate(
      title: 'Angular',
      issuer: 'Infosys Springboard',
      date: 'June 5, 2025',
      imagePath: '${AppConstants.certificatesPath}/Angular.jpg',
    ),
    Certificate(
      title: 'Creating Responsive Web Pages using Bootstrap 4',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath:
          '${AppConstants.certificatesPath}/Creating Responsive Web Pages using Bootstrap 4.jpg',
    ),
    Certificate(
      title: 'CSS3',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/CSS.jpg',
    ),
    Certificate(
      title: 'Email Writing Skills',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/Email Writing Skills.jpg',
    ),
    Certificate(
      title: 'High Impact Presentations',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath:
          '${AppConstants.certificatesPath}/High Impact Presentations.jpg',
    ),
    Certificate(
      title: 'HTML5 - The Language',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/HTML.jpg',
    ),
    Certificate(
      title: 'JavaScript',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/JavaScript.jpg',
    ),
    Certificate(
      title: 'Networking and Web Technology',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath:
          '${AppConstants.certificatesPath}/Networking and Web Technology.jpg',
    ),
    Certificate(
      title: 'Time Management',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/Time Management.jpg',
    ),
    Certificate(
      title: 'Twitter Bootstrap',
      issuer: 'Infosys Springboard',
      date: 'June 5, 2025',
      imagePath: '${AppConstants.certificatesPath}/Twitter Bootstrap.jpg',
    ),
    Certificate(
      title: 'TypeScript',
      issuer: 'Infosys Springboard',
      date: 'June 5, 2025',
      imagePath: '${AppConstants.certificatesPath}/TypeScript.jpg',
    ),
    Certificate(
      title: 'User Experience',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/User Experience.jpg',
    ),
    Certificate(
      title: 'Website Creation',
      issuer: 'Infosys Springboard',
      date: 'June 4, 2025',
      imagePath: '${AppConstants.certificatesPath}/Website Creation.jpg',
    ),
    Certificate(
      title: 'Introduction to Cybersecurity',
      issuer: 'Cisco Networking Academy',
      date: '2025',
      imagePath: '${AppConstants.certificatesPath}/cyber.png',
    ),
    Certificate(
      title: 'Web Designing',
      issuer: 'DST, Govt. of India',
      date: '2019',
      imagePath: '${AppConstants.certificatesPath}/1727499918523.jpeg',
    ),
  ];

  static const List<Education> education = [
    Education(
      institution: 'Karpagam Academy Of Higher Education',
      course: 'B.Tech Artificial Intelligence and Data Science',
      duration: '2024 - 2028',
      grade: 'CGPA: 8.75',
      description:
          'Currently pursuing a degree in Artificial Intelligence and Data '
          'Science while improving programming, data science, AI, and full-stack '
          'development skills.',
    ),
    Education(
      institution: 'Government Boys Higher Secondary School - Thondamuthur',
      course: 'HSC - XII',
      duration: '2023 - 2024',
      grade: 'Grade: 88.6%',
      description:
          'Learned Python, explored technical skills, and scored 100% in '
          'Computer Science.',
    ),
    Education(
      institution: 'Government Boys Higher Secondary School - Thondamuthur',
      course: 'HSC - XI',
      duration: '2022 - 2023',
      grade: 'Grade: 83.5%',
      description:
          'Chose Computer Science and built a foundation in programming and '
          'logical problem-solving.',
    ),
    Education(
      institution: 'Government Higher Secondary School - Kalveerampalayam',
      course: 'SSLC - X',
      duration: '2021 - 2022',
      grade: 'Grade: 69.4%',
      description:
          'Built an academic foundation and developed an early interest in '
          'computers and problem-solving.',
    ),
  ];

  static const List<Achievement> achievements = [
    Achievement(
      title: 'ISTE Student Chapter Secretary',
      description: 'Leads and contributes to technical events and workshops.',
      year: '2025',
    ),
    Achievement(
      title: 'AIQubit Member',
      description:
          'Participates in collaborative AI and technology activities.',
      year: '2025',
    ),
    Achievement(
      title: '100% in Computer Science',
      description: 'Scored full marks in Computer Science during HSC.',
      year: '2024',
    ),
    Achievement(
      title: 'Multiple Certified Courses',
      description:
          'Completed certifications across UX, Angular, Python, IoT, and soft skills.',
      year: '2025',
    ),
  ];

  static const List<ContactLink> contactLinks = [
    ContactLink(
      label: 'Email',
      value: AppConstants.email,
      url: 'mailto:${AppConstants.email}',
      icon: Icons.email_outlined,
    ),
    ContactLink(
      label: 'Phone',
      value: AppConstants.phone,
      url: 'tel:+919345211194',
      icon: Icons.phone_outlined,
    ),
    ContactLink(
      label: 'LinkedIn',
      value: 'linkedin.com/in/ukdeepak',
      url: AppConstants.linkedInUrl,
      icon: Icons.business_center_outlined,
    ),
    ContactLink(
      label: 'GitHub',
      value: 'github.com/DeepakUK17',
      url: AppConstants.githubUrl,
      icon: Icons.code_outlined,
    ),
    ContactLink(
      label: 'WhatsApp',
      value: '+91 93452 11194',
      url: AppConstants.whatsAppUrl,
      icon: Icons.chat_outlined,
    ),
  ];
}
