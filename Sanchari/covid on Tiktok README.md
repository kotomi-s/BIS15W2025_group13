# Title of Dataset: Coded data based on sample of COVID-related videos from TikTok

---

Videos and related metadata were downloaded using a third-party TikTok Scraper (https://github.com/drawrowfly/tiktok-scraper) using the search term #coronavirus. Videos were reviewed for content and data were entered on a spreadsheet.

## Description of the Data and file structure

We retrospectively reviewed a random sample of user-created videos on TikTok associated with the hashtag #coronavirus.
Each row represents a video. Variables were constructed based on review of video content and metadata.
Videos were eligible for inclusion if published in English on or before the date of the search (September 1, 2020).
Videos were excluded if unviewable due to privacy settings or determined based on preliminary review to be unrelated to COVID-19, related illness, or related public health measures.

Videos and related metadata were downloaded using a third-party TikTok Scraper (https://github.com/drawrowfly/tiktok-scraper).

Prior to review of video content, a codebook was developed by a hospital epidemiologist with expertise in infectious diseases and a clinician with expertise with social media research.
The codebook reflected public health guidance related to COVID-19 and served as a reference to identify misinformation.
Videos were viewed and annotated between September 2020 and January 2021.

Prior to review of videos, evidence-based information related to each section of the codebook was reviewed by the research team.
Presence of misinformation in each video was graded as low, moderate, or high based on the extent and degree of misinformation.

Video quality was assessed using two validated scales: the Patient Education Materials Assessment Tool (PEMAT) and DISCERN.

Video comments were reviewed to identify requests for medical advice, provision of medical advice, reported intention to change behavior, or commercial advertising.
Comments reflecting each category were considered present if at least one relevant comment was found.


## Variables

views = number of times the video was views [integer] 
likes = number of times the video was liked [integer]
comments = number of comments on the video [integer]
official_source = publisher is government agency, foundation, or advocacy group [0,1]
pub_hcp = publisher is a healthcare professional [0,1]
pub_news = publisher is a news source or media outlet [0,1]
pub_patient = publisher is a news source or media outlet [0,1]
pub_other = publisher is a news source or media outlet [0,1]
female = publisher is a woman [0,1]
gender_other = publisher is not an individual or has no discernible gender [0,1]
age00 = publisher is age <30 [0,1]
age30 = publisher is age 30-50 [0,1]
age50 = publisher is age >50 [0,1]
age_unk = publisher is not an individual, age unknown, or age not discernible [0,1]
topic_humor = video includes humor [0,1]
topic_ip = main topic is infection prevention [0,1]
topic_clinical = main topic is clinical disease [0,1]
d_descriptionofriskfactors = includes description of risk factors [0,1]
d_descriptionofsymptoms = includes description of symptoms [0,1]
d_modesoftransmission = includes discussion of modes of transmission [0,1]
d_masks = includes discussion of masks [0,1]
d_demonstratewearingmask = includes description of how to wear a mask [0,1]
d_eyeprotection = includes discussion of eye protection [0,1]
d_handhygiene = includes discussion of hand hygiene [0,1]
d_socialdistancing = includes discussion of social distancing [0,1]
d_testing = includes discussion of testing [0,1]
d_preventiondiscussed = includes discussion of preventing infection [0,1]
d_quarantining = includes discussion of quarantine or isolation [0,1]
d_commercialbias = appearance of commercial bias or conflict of interest [0,1]
masksent_pos = positive sentiment towards masking [0,1]
masksent_neg = negative sentiment towards masking [0,1]
masksent_neu = neutral sentiment towards masking [0,1]
testsent_pos = positive sentiment towards testing [0,1]
testsent_neg = negative sentiment towards testing [0,1]
testsent_neu = neutral sentiment towards testing [0,1]
discern_moderate = includes description of risk factors [0,1]
discern_high = overall rating on DISCERN of high (DISCERN item #16) [0,1]
discern_low = overall rating on DISCERN of low (DISCERN item #16) [0,1]
discern_mh = overall rating on DISCERN of moderate or high (DISCERN item #16) [0,1]
p_understand_high = PEMAT understandability total >= 80 [0,1]
p_action_high = PEMAT actionability total >= 80 [0,1]
misinfo_high = high level of misinformation [0,1]
misinfo_mod = moderate level of misinformation [0,1]
misinfo_level = level of misinformation [0 = low/none, 1 = moderate, 2 = high]
misinfo_any = moderate or high level of misinformation [0,1]
behavior_change = presence of comment reflecting intention to change behavior [0,1]

## Sharing/access Information

Data were generated specifically for this project.

