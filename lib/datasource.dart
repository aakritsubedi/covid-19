import 'package:flutter/material.dart';

Color primaryBlack = Color(0xFF152238);
Color quoteContainer = Colors.orange[100];
Color vaccineContainer = Colors.blue[200];

class DataSource {
  static String quotes =
      "Nothing in the life is to be feared, it is only to be understood. Now is the time understand more, so that we fear less.";

  static String vaccine =
      "Nepal launched Covid-19 immunisation after India sent vaccines. India sent 10 lakh doses of Covishield vaccines to Nepal as a gift.";

  static List questionAnswers = [
    {
      "question": "What is a coronavirus?",
      "answer":
          "Coronaviruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19."
    },
    {
      "question": "What is COVID-19?",
      "answer":
          "COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019."
    },
    {
      "question": "What are the symptoms of COVID-19?",
      "answer":
          "The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and don't feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention."
    },
    {
      "question": "How does COVID-19 spread?",
      "answer":
          "People can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick. \nWHO is assessing ongoing research on the ways COVID-19 is spread and will continue to share updated findings."
    },
    {
      "question":
          "Can the virus that causes COVID-19 be transmitted through the air?",
      "answer":
          "Studies to date suggest that the virus that causes COVID-19 is mainly transmitted through contact with respiratory droplets rather than through the air"
    },
    {
      "question": "Can CoVID-19 be caught from a person who has no symptoms?",
      "answer":
          "The main way the disease spreads is through respiratory droplets expelled by someone who is coughing. The risk of catching COVID-19 from someone with no symptoms at all is very low. However, many people with COVID-19 experience only mild symptoms. This is particularly true at the early stages of the disease. It is therefore possible to catch COVID-19 from someone who has, for example, just a mild cough and does not feel ill.  WHO is assessing ongoing research on the period of transmission of COVID-19 and will continue to share updated findings.    "
    },
    {
      "question":
          "Can I catch COVID-19 from the feces of someone with the disease?",
      "answer":
          "The risk of catching COVID-19 from the feces of an infected person appears to be low. While initial investigations suggest the virus may be present in feces in some cases, spread through this route is not a main feature of the outbreak. WHO is assessing ongoing research on the ways COVID-19 is spread and will continue to share new findings. Because this is a risk, however, it is another reason to clean hands regularly, after using the bathroom and before eating."
    },
    {
      "question": "How likely am I to catch COVID-19?",
      "answer":
          "The risk depends on where you  are - and more specifically, whether there is a COVID-19 outbreak unfolding there.\nFor most people in most locations the risk of catching COVID-19 is still low. However, there are now places around the world (cities or areas) where the disease is spreading. For people living in, or visiting, these areas the risk of catching COVID-19 is higher. Governments and health authorities are taking vigorous action every time a new case of COVID-19 is identified. Be sure to comply with any local restrictions on travel, movement or large gatherings. Cooperating with disease control efforts will reduce your risk of catching or spreading COVID-19.\nCOVID-19 outbreaks can be contained and transmission stopped, as has been shown in China and some other countries. Unfortunately, new outbreaks can emerge rapidly. It’s important to be aware of the situation where you are or intend to go. WHO publishes daily updates on the COVID-19 situation worldwide."
    },
    {
      "question": "Who is at risk of developing severe illness?",
      "answer":
          "While we are still learning about how COVID-2019 affects people, older persons and persons with pre-existing medical conditions (such as high blood pressure, heart disease, lung disease, cancer or diabetes)  appear to develop serious illness more often than others. "
    },
    {
      "question": "Should I wear a mask to protect myself?",
      "answer":
          "Only wear a mask if you are ill with COVID-19 symptoms (especially coughing) or looking after someone who may have COVID-19. Disposable face mask can only be used once. If you are not ill or looking after someone who is ill then you are wasting a mask. There is a world-wide shortage of masks, so WHO urges people to use masks wisely.\nWHO advises rational use of medical masks to avoid unnecessary wastage of precious resources and mis-use of masks\nThe most effective ways to protect yourself and others against COVID-19 are to frequently clean your hands, cover your cough with the bend of elbow or tissue and maintain a distance of at least 1 meter (3 feet) from people who are coughing or sneezing"
    },
    {
      "question":
          "Are antibiotics effective in preventing or treating the COVID-19?",
      "answer":
          "Millions of people in the United States have received COVID-19 vaccines, and these vaccines have undergone the most intensive safety monitoring in U.S. history. This monitoring includes using both established and new safety monitoring systems to make sure that COVID-19 vaccines are safe."
    },
  ];

  static List vaccineFAQ = [
    {
      "question": "Are Covid-19 vaccines safe?",
      "answer":
          "No. Antibiotics do not work against viruses, they only work on bacterial infections. COVID-19 is caused by a virus, so antibiotics do not work. Antibiotics should not be used as a means of prevention or treatment of COVID-19. They should only be used as directed by a physician to treat a bacterial infection. "
    },
    {
      "question": "What are the most common side effects after getting a COVID-19 vaccine?",
      "answer": "After getting vaccinated, you may have some side effects, which are normal signs that your body is building protection. The most common side effects are pain and swelling in the arm where you received the shot. In addition, you may have fever, chills, tiredness, and headache. These side effects may affect your ability to do daily activities, but they should go away in a few days. Learn more about what to expect after getting a COVID-19 vaccine."
    },
    {
      "question": "If I am pregnant, can I get a COVID-19 vaccine?",
      "answer": "Yes. If you are pregnant, you may choose to be vaccinated when it’s available to you. There is currently no evidence that antibodies formed from COVID-19 vaccination cause any problem with pregnancy, including the development of the placenta. People who are trying to become pregnant now or who plan to try in the future may receive the COVID-19 vaccine when it becomes available to them. There is no evidence that fertility problems are a side effect of any vaccine, including COVID-19 vaccines. There is no routine recommendation for taking a pregnancy test before you get a COVID-19 vaccine. If you have questions about getting vaccinated, talking with a healthcare provider may might help you make an informed decision. Learn more at vaccination considerations for people who are pregnant or breastfeeding."
    },
    {
      "question": "How long does protection from a COVID-19 vaccine last?",
      "answer": "We don’t know how long protection lasts for those who are vaccinated. What we do know is that COVID-19 has caused very serious illness and death for a lot of people. If you get COVID-19, you also risk giving it to loved ones who may get very sick. Getting a COVID-19 vaccine is a safer choice. Experts are working to learn more about both natural immunity and vaccine-induced immunity. CDC will keep the public informed as new evidence becomes available."
    },
    {
      "question": "What are the ingredients in COVID-19 vaccines?",
      "answer": "The ingredients in currently available COVID-19 vaccines include mRNA, lipids, salts, sugars, and buffers. Buffers help maintain the stability of the pH solution. Vaccine ingredients can vary by manufacturer. To learn more about the ingredients in authorized COVID-19 vaccines, see articles on Information about the Pfizer-BioNTech COVID-19 vaccine and Information about the Moderna COVID-19 vaccine."
    },
    {
      "question": "What is the latest news on Covid vaccine?",
      "answer":
          "Latest news: On February 2, the medical journal The Lancet published the results of a phase three trial in Moscow that found the Sputnik V vaccine is safe and 91.6-percent effective in preventing COVID-19."
    },
    {
      "question": "Can I drink after Covid vaccine?",
      "answer":
          "VERIFY: You don't need to avoid alcohol after getting the COVID-19 vaccine. Some people claim drinking alcohol will negatively affect your body's response to the coronavirus vaccine. Experts say there is no evidence to support this."
    },
    {
      "question": "Who is paying for the COVID-19 vaccines?",
      "answer": "The federal government is providing the vaccine free of charge to all people living in the United States. Vaccination providers can be reimbursed for vaccine administration fees by the patient’s public or private insurance company or, for uninsured patients, by the Health Resources and Services Administration’s Provider Relief Fund. No one can be denied a vaccine if they are unable to pay a vaccine administration fee.​"
    },
    {
      "question": "Can I get vaccinated against COVID-19 while I am currently sick with COVID-19?",
      "answer": "No. People with COVID-19 who have symptoms should wait to be vaccinated until they have recovered from their illness and have met the criteria for discontinuing isolation; those without symptoms should also wait until they meet the criteria before getting vaccinated. This guidance also applies to people who get COVID-19 before getting their second dose of vaccine."
    },
    {
      "question": "Does the Pfizer vaccine prevent Covid?",
      "answer":
          "The Pfizer-BioNTech COVID-19 Vaccine is authorized for use under an Emergency Use Authorization (EUA) for active immunization to prevent coronavirus disease 2019 (COVID-19) caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) in individuals 16 years of age and older."
    },
    {
      "question": "Do you have to wear a mask after Covid vaccine?",
      "answer": "Yes. The vaccine does not offer 100% protection."
    },
    {
      "question": "Can masks prevent the transmission of COVID-19?",
      "answer":
          "Masks should be used as part of a comprehensive strategy of measures to suppress transmission and save lives; the use of a mask alone is not sufficient to provide an adequate level of protection against COVID-19."
    }
  ];
}
