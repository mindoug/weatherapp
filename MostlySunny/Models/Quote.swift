//
//  Quote.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/6/21.
//

import Foundation

struct Quote {

 var quotes: [String] = [
    
    """
      "I am going to make everything around me beautiful - that will be my life.” - Elsie De Wolfe
      """,
    
        """
        “When joy is a habit, love is a reflex.” - Bob Goff
        """,
    
        """
        “Courage is going from failure to failure without losing enthusiasm” - Winston Churchill
        """,
    
        """
        “Inhale, exhale, it is well.  All of this is part of the story you will tell.” - Morgan Harper Nichols
        """,
    
        """
        “Start where you are.  Use what you have.  Do what you can.” - Arthur Ashe
        """,
    
        """
        “Beauty is not in the face; beauty is a light in the heart.” - Kahlil Gibran
        """,
    
        """
        “The most beautiful people wear their hearts on their sleeves, and their souls in their smiles.” - Mark Anthony
        """,
    
        """
        “It always seems impossible until it’s done.” - Nelson Mandela
        """,
    
        """
        “Don’t compare your beginning to someone else’s middle.”  Jon Acuff
        """,
    
        """
        “By being yourself, you put something wonderful in the world that was not there before.” - Edwin Elliot
        """,
    
        """
        “If you have good thoughts, they will shine out of your face like the sun beams and you will always look lovely.” - Roald Dahl
        """,
    
        """
        “Life is either a daring adventure or nothing at all.” - Helen Keller
        """,
    
        """
        “Spread love wherever you go.  Let no one ever come to you without leaving happier.” - Mother Teresa
        """,
    
        """
        “Wherever you stand, be the soul of that place.” - Rumi
        """,
    
        """
        “If you think you’re too small to make a difference, you haven’t spent a night with a mosquito.” - African Proverb
        """,
    
        """
        “Life goes by fast.  Enjoy it.  Calm down.  It’s all funny.” - Joan Rivers
        """,

        """
        “For whatever it’s worth it’s never too late to be whoever you want to be.” - F. Scott Fitzgerald
        """,
    
        """
        “When you have a dream, you’ve got to grab it and never let go.” - Carol Burnett
        """,
    
        """
        “Nothing is impossible.  The word itself says “I’m Possible!”  Audrey Hepburn
        """,
       
        """
        “Sometimes you will never know the value of  a moment, until it becomes a memory.” - Dr. Seuss
        """,
    
        """
        “If you can dance and be free and not be embarrassed, you can rule the world.” - Amy Poehler
        """,
    
        """
        “My mission in life is not merely to survive but to thrive and do so with some passion, some compassion, some humor and some style.”  Maya Angelou
        """,
    
      """
      “You can be gorgeous at thirty, charming at forty, and irresistible for the rest of your life”. - Coco Chanel
      """,
    
      """
      “Be messy and complicated and afraid and show up anyways.” - Glennon Doyle Melton
      """,
    
      """
      “I raise up my voice- not so that I can shout, but so that those without a voice can be heard.” - Malala Yousafzai
      """,
    
      """
      “I am thankful for my struggle because, without it, I wouldn’t have stumbled across my strength.” - Alex Elle
      """,
    
      """
      “It took me quite a long time to develop a voice, and now that I have it, I’m not going to be silent.” - Madeleine Albright
      """,
    
      """
      “There is no limit to what we, as women, can accomplish.”  Michelle Obama
      """,
    
      """
      “She does not know what the future holds, but she is grateful for slow and steady growth.” - Morgan Harper Nichols
      """,
    
      """
      Fearlessness is like a muscle.  I know from my own life that the more I exercise it the more natural it becomes to not let my fears run me.” - Arianna Huffington
      """,
    
      """
      Think like a queen.  A queen is not afraid to fail.  Failure is another stepping stone to greatness.” - Oprah Winfrey
      """,
    
      """
      “I found that ultimately if you truly pour your heart into what you believe in - even if it makes you vulnerable - amazing things can and will happen.” - Emma Watson
      """,
    
      """
      “We do not need magic to transform our world.  We carry all the power we need inside ourselves already.” - J.K. Rowling
      """,
    
      """
      “What you do makes a difference, and you have to decide what kind of difference you want to make.” - Jane Goodall
      """,
    
      """
      “The way I see it, if you want the rainbow, you gotta put up with the rain!” - Dolly Parton
      """,
    
      """
      “When you have a dream, you’ve got to grab it and never let go.” - Carol Burnett
      """,
    
      """
      “Wherever you go, no matter what the weather, always bring your own sunshine.” -  Anthony J. D’Angelo
      """,
    
        """
        “If you want the sunshine, you have to weather the storm.”  Frank Lane“There’s no such thing as bad weather, just soft people.” - Bill Bowerman
        """,
    
        """
        “Nature is so powerful, so strong.  Capturing its essence is not easy- your work becomes a dance with light and the weather.  It takes you to a place within yourself.” - Annie Leibovitz
        """,
    
        """
        “Sunshine is delicious, rain is refreshing, wind braces us up, snow is exhilarating; there is really no such thing as bad weather, only different kinds of good weather.” - John Ruski
        """,
    
        """
        “It is only in sorrow bad weather masters us; in joy we face the storm and defy it.” - Amelia Barr
        """,
    
        """
        “Who cares about the clouds when we’re together.  Just sing a song and bring the sunny weather.” - Dale Evans
        """,
    
        """
        “Sometimes I wish that I was the weather, you’d bring me up in conversation forever.  And when it rained, I’d be the talk of the day.” - John Mayer
        """,
    
        """
        “A change in the weather is sufficient to recreate the world and ourselves.” - Marcel Proust
        """,
    
      """
      “It doesn’t matter what people say about me.  I weather the storm.”  Terell Owens
      """,
  ]
  
 
  // lazy var means property is null until accessed for the first time, which means self.bounds is availible because property cannot be accessed until after self is initialized
  
  lazy var randomQuote = quotes.randomElement()!
  
}
