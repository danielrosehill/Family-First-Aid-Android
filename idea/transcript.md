# Interactive First Aid Reference App — voice note transcript

> Source: `emergency-app.mp3`. Lightly edited by the transcription model (filler removed, punctuation and headings added).

### The Problem with Traditional First Aid Resources

The purpose of this voice note is to gather together context data for an idea that I would like to roll out, one of several ideas that I've been keeping on pause.

I've wanted for some time to have a good first aid reference. This became relevant because my wife and we have a 15-month-old. We did a first aid training before he was born. In my teenage years, I did pool lifeguarding and lots of first aid. The thing I feel about first aid is that the approach of putting it in a big book, a big binder that you feel good about buying and then never look at, is probably the most common problem that there is. It is everyone's natural instinct.

I was thinking there should be an app with all the technology that is interactive or uses AR, but when I went looking for that, I really didn't find much in that direction.

### The Core Concept: Spaced Repetition

This is the idea as it came to me just now. I was thinking, should I print it? But I feel like the best approach is spaced repetition, which I think in a book doesn't really make a lot of sense; it would be better in the format of an app. The deliverable for the project would be to create a simple APK that can be sideloaded onto Android.

The first aid resources I gathered were put together because we're parents now—that was my motivator. When I was doing that, I realized that it doesn't make sense to have it just for children because as parents, we're all one team. A first aid resource for the family has to cover everyone.

### Content Stratification

Then the question becomes, does it make the most sense to stratify material by child versus adult, or to have it broken down by emergency? I think the latter makes more sense. You would have circulatory emergencies, etc.

Being based in Israel, I want to create a resource with the Magen David Adom guidelines—that's our first aid organization. That is probably what this will be, but I'd love for anyone to fork the idea and ground it in their own organization's recommendations. Israel generally leans into international best practice for its recommendations, so I often like to see if there's a gap. I've already done the research and gathered as much material as I could from the internet maybe six months ago. To the extent that Magen David Adom or Hatzalah didn't have a guideline but the American Red Cross had done it, I pulled from the American Red Cross.

For the stuff that is Israel-specific, that's important, but for most things, the priority is getting the best evidence from international consensus.

### App Features and Functionality

In concrete terms, the app would be an APK containing all the material. It is very important for it to be able to function offline to the maximum extent possible. For updates, the normative way for new versions would just be to create a new release and then download the new APK.

There are a few things I'd like in the app. The first is the information. The second thing is decision flowcharts. I personally like those a lot. If you're using it in an emergency or assessing whether you need to go to the ER—of course, it should carry a disclaimer that this is not an official medical tool—those questionnaire-based flows traditionally represented as flow diagrams or state machines are the best.

So, strand one is the curriculum/material. Strand two is the decision flowcharts that can be nested within the material as well as standalone elements. The app has to be built with a UI that prioritizes both routine use and the realistic chance that it might be consulted during a crisis where you need information as quickly as possible. For that reason, we should also have 'click to dial' for the relevant emergency services in Israel, and then just a few links I'd find valuable, namely Terem branches (urgent care) and the Maccabi Moked number.

### Spaced Review and Progress Tracking

The final strand is a method for spaced review. There could be a progress bar that the user can reset at any point. I'm not sure if the most elegant implementation would be a calendar reminder or scheduled pings, but I don't think that can be implemented very easily just in Android.

I think the best balance of features would be a module where you can go into a topic—let's say airway support or asthma—select child or adult, go through the material, and then mark it as 'completed' the first time. Then, you can 'mark as reviewed,' and the app can display the review dates.

If there were any cloud component to this—something my wife and I would use predominantly—it would be a 'sign in with Google' feature to store your review history and sync that to Google Drive storage. Of course, that requires Google Workspace integration, which could be a Phase 2 idea. Phase 1 can just be the actual app and functionality.

### Visuals and Style

It is very rare to see first aid material without some kind of graphics. These can definitely be generated with AI and shipped in the APK binary. We could use short videos too, but I would start with just images and try to keep the bar fairly easy for accuracy. It would probably be good to define a style guide for these materials so the app has a consistent look and feel.
