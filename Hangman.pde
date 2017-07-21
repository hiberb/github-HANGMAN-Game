//Globale Variablen  //<>//

PFont myFont; //Schriftart, die benutzt wird 
public int numRight = 0; //Richtig
public int numWrong = 0; //Falsch
public int winner = 0; //Gewinner
public boolean guessedRight = false;
public Boolean Gewonnen = false;
public Boolean Verloren = false;
public int falsch = 0;
public int richtig = 0;
public int counter = 0;
public int counter2 =0;
public int counter3 = 0;
public String hilfe = ">"; // Damit keine Null Pointer Exception erscheint und das Programm abstürzt
color colorA = color(255,165,79);
color colorB = color(151,255,255);
color colorC = color(0,255,0);
public Boolean anfang = true;
public Boolean hoch = false;
public Boolean ausgabe = false;


//Bilder werden definiert

PImage img;   
PImage img2;  
PImage img3;  
PImage img4;  
PImage img5;  
PImage img6;   
PImage img7; 
PImage img8;  
PImage img9; 
PImage img10; 
PImage img11; 




String [] game = {"JAVA", "JAVASCRIPT", "PYTHON", "RUBY","PROCESSING","JAVAFX"}; //Vordimensioniertes und initialisiertes Array mit Namen ''game''
int answerKey = 0;
String answer;
char guessed[]; //Array guessed(guessed = Vermutung)
char wrong[]; //Array wrong



String display = "Geben Sie nur einen Buchstaben ein (keine Großbuchstaben!)";
String display2 = "und drücken Sie Enter";
String display3 = "";
String wrongAnswers = "";


String typing = " ";
String guess = " ";


public Boolean geladen = false;


void setup()
{
    typing = " "; //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet
    guess = " ";  //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet

if(geladen == false)
{
   //Bilder werden vom Speicher in das Programm am Anfang geladen(Start dauert deshalb länger)
   img   = loadImage("hang1.png"); 
   img2  = loadImage("hang2.png");
   img3  = loadImage("hang3.png");
   img4  = loadImage("hang4.png");
   img5  = loadImage("hang5.png");
   img6  = loadImage("hang6.png");
   img7  = loadImage("hang7.png");
   img8  = loadImage("hang8.png");
   img9  = loadImage("hang9.png");
   img10 = loadImage("hang10.png");
   img11 = loadImage("hang10weiss.png"); 
   size(600, 600);
   myFont = createFont("Verdana", 16, true);
   typing = " "; //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet
   guess = " ";  //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet
}
  else
  
   

   
  typing = " "; //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet
  guess = " ";  //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet

  size(600, 600);
  myFont = createFont("Verdana", 16, true); //Auswahl der Schriftart und der Schriftgröße
  answerKey = int(random(0, game.length)); //Es wird ein Random Wort aus dem Array gewählt
  answer = game[answerKey];
  winner = answer.length();

  char[] gameChar = new char [answer.length()];
  guessed = new char [answer.length()];
  
  for (int i = 0; i < answer.length(); i++)
  {
      gameChar[i] = answer.charAt(i);
      guessed[i] = '_'; //Anzahl der Buchstaben werden mit _ vorgegeben

    wrong = new char[10]; //Man hat 10 Versuche um das Wort zu erraten
    
    for (int s = 0; s < 10; s++)
    {
        wrong[s] = '#'; // Es werden 10 ''#'' Platzhalter für falsche Buchstaben vorgegeben
    }  
  }
}


void draw()
{
  
  if (anfang == true) //Startscreen am Anfang
  {   
      background(0);
      fill(255);
      textSize(25);
      image(img11,130, 108, 300,300);              
      text("Spielsteuerung ''Hang Man''",160,30);    
      text("-------------------------------------",157,40);
      text("Drücke ''Pfeil nach oben'' zum Spielen!",10,100);
      text("''Pfeil nach rechts'' um ins Menü zu gelangen",10,200);
      text("Derzeitiger Bereich: Hauptmenü",100,580);
    
    if (keyCode == UP) 
    {
    for (int y = 0; y < 50;y++) //<>//
    {      
       background(0);
       fill(255,250,250);
       text("Bitte warten.....",50,460);
     
     for (int d = 0; d < 30;d++)
     {
        if ( d == 29)
        {
            background(0);
            fill(255,250,250);
            image(img11,130, 108, 300,300);  
            text("Bitte warten.....  --> 100 % geladen",50,460);
            text("---------------------------------------------------",50,480);
            text("Laden fertig, drücke ''Pfeil nach unten''",50,510); 
            return;
        }       
     }
  }          
}


    
} 
 else
 
  background(255);
  fill(0);
  text("Richtig: ",50,50);
  text(richtig,100,100);
  text("Falsch: ",500,50);
  text(falsch,550,100);
  text("---------------------------------------------------------------------------------------------------------------------",1,140);

  wrongAnswers = "Falsche Buchstaben: ";
  int Platz  = 25; // Platzhalter-Variable
  display3 = "";

  for (int i = 0; i < 10; i++)
  {
      wrongAnswers = wrongAnswers + " "+ wrong[i]; //Falscher Buchstabe wird ausgegeben
  }


  textFont(myFont);
  fill(0);

  for (int i = 0; i < guessed.length; i++)
  {
      display3 = display3 +" "+ guessed[i];
  }

  text("-> Zum Löschen des Buchstabens Backspace drücken",8,160);
  text(display3, Platz, 200); //Ausgabe von display3
  text(display, Platz, 400);  //Ausgabe von display
  text(display2, Platz, 430); //Ausgabe von display2
  text(typing, Platz, 490);  //Ausgabe von typing
  text(wrongAnswers, Platz, 550); //Ausgabe von wrongAnswers
  guess = typing;  //typing wird in guess geschreiben

      if (counter3 >= 1 & hoch == false) //Damit Falsch einmal erhöht wird
      {
          falsch++; 
          hoch = true;
          return;
      }



      while (counter3 >= 1) //Abbruch wenn Spieler versucht zu schummeln!
      { 
          typing = "";
          guess = "";
          display = "Betrugsversuch!!";
          image(img10,300, 45, 300,300); 
          text("SELBER SCHULD! DU HAST VERLOREN!",100,500);
          display2 = "Zum Neustart ''Pfeil nach oben'' drücken!";
          return; 
      }





 if (typing.length() == 0 && key == ENTER)
  {
    
    
  // Abfragen nach den Bildern, die erscheinen sollen
  
  if (counter2 == 1) 
  {
      image(img,300,45,300,300);
      return;
  } 
  
  else if (counter2 == 2)
  {
     image(img2,300,45,300,300); 
     return;
  }
  
  else if  (counter2 == 3)
  {
      image(img3,300,45,300,300);
      return;
  } 
  
  else if  (counter2 == 4)
  {
     image(img4,300,45,300,300); 
     return;
  }
  
  else if  (counter2 == 5)
  {
      image(img5,300,45,300,300);   
      return;
  } 
  
  else if  (counter2 == 6)
  {
     image(img6,300,45,300,300); 
     return;
  }
  
  else if  (counter2 == 7)
  {
      image(img7,300,45,300,300);
      return;
  } 
  
  else if  (counter2 == 8)
  {
      image(img8,300,45,300,300); 
      return;
  }
  
  else if  (counter2 == 9)
  {
      image(img9,300,45,300,300);
      return; 
  }
  
  else if  (counter2 == 10)
  {
     image(img10,300,45,300,300); 
     return;
  }    
     return;   
 }


 if (typing.length() == 2)
  {
       typing = "";
       guess = "";
  }

  if (typing.length() > 1) // Üerprüfung, dass man auch nur ''einen'' Buchstaben eingebenen hat!
  {
      display = "Geben Sie nur einen Buchstaben ein (keine Großbuchstaben!)";
      typing = " "; //Variable Typing wird wieder gelöscht um eine neue Eingabe zu ermöglichen  
      return;  
  }
  
  if (typing.length() == 1 && key == BACKSPACE) // Abfrage, damit das Programm nicht hängen bleibt
  {
      typing ="";
      return;  
  }  
  
  if (counter2 == 1) // Abfragen nach den Bildern, die erscheinen sollen
  {
     image(img,300,45,300,300);
     return;
  } 
  
  else if (counter2 == 2)
  {
     image(img2,300,45,300,300); 
     return;
  }
  
  else if  (counter2 == 3)
  {
     image(img3,300,45,300,300);
     return;
  } 
  
  else if  (counter2 == 4)
  {
     image(img4,300,45,300,300); 
     return;
  }
  
  else if  (counter2 == 5)
  {
     image(img5,300,45,300,300);   
     return;
  } 
  
  else if  (counter2 == 6)
  {
     image(img6,300,45,300,300); 
     return;
  }
  
  else if  (counter2 == 7)
  {
     image(img7,300,45,300,300);
     return;
  } 
  
  else if  (counter2 == 8)
  {
     image(img8,300,45,300,300); 
     return;
  }
  
    else if  (counter2 == 9)
  {
     image(img9,300,45,300,300);
     return; 
  }
  
  else if  (counter2 == 10)
  {
     image(img10,300,45,300,300); 
     return;
  } 



    if (keyCode == DOWN)  //Abfrage für das Laden der Menüseite
    { 
         anfang = false;
    }

  
     if(keyCode == RIGHT)    //Abfrage für das Laden der Spielseite
     {
         typing = " ";
         guess = " ";
         counter2 = 0;
         counter = 0;
         Gewonnen = false;
         Verloren = false;
         guessedRight = false; 
         numRight = 0; 
         numWrong = 0; 
         winner = 0; 
         display = "Geben Sie nur einen Buchstaben ein (keine Großbuchstaben)";
         display2 = "und drücken Sie Enter!"; 
         anfang = true; 
     }  
     
     
     if (keyCode == UP)
     {
        typing = ">";
        guess = " ";
        
        for (int v = 0;v<50;v++)
       {
         
            background(0);
            fill(255,250,250);
            text("Bitte Warten.....",50,460);
         
         
         for (int r = 0 ; r < 30;r++)
         {
              if (r == 29)
              {
                    background(0);
                    fill(255,250,250);
                    text("Bitte warten.....  --> 100 % geladen",50,460);
                    text("---------------------------------------------------",50,480);
                    text("Laden fertig, drücke ''Pfeil nach unten''",50,510);  
                    return;
              }  
          }       
      }           
   }
} 



void keyPressed()
{

  
  if (typing.length() == 0 && key == ENTER)
  {
     return; 
  }
  
  
  if (key == ENTER && Gewonnen == true)
  {
     return; 
  }
  if (key == ENTER && Verloren == true)
  {
     return; 
  }
  
  if (key == ENTER)
  {
    play(typing);
    
    if (typing.length() == 0)
    {
      typing = " ";  
    }
      
  } else 
  {
      typing = typing + key;
  }
  
  if (keyCode == UP)
  {
    anfang = false; 
    
    typing = ">"; //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet
    guess = " ";  //Damit die Variablen bei dem Wechseln der Form und auch am Anfang auf jeden Fall leer sind, weil der Buchstabe sonst nach Eingabe verschwindet

    answerKey = int(random(0, game.length)); //Es wird ein Random Wort aus dem Array gewählt
    answer = game[answerKey];
    winner = answer.length();

    
    char[] gameChar = new char [answer.length()];
    guessed = new char [answer.length()];
    
    for (int i = 0; i < answer.length(); i++)
    {
        gameChar[i] = answer.charAt(i);
        guessed[i] = '_'; //Anzahl der Buchstaben werden mit _ vorgegeben
    }
    
    
    
    wrong = new char[10]; //Man hat 10 Versuche, um das Wort zu erraten
    for (int s = 0; s < 10; s++)
    {
      wrong[s] = '#'; // Es werden 10 # Platzhalter für falsche Buchstaben vorgegeben
    }
    
       hoch = false;
       counter3 = 0;
       counter2 = 0;
       counter = 0;
       Gewonnen = false;
       Verloren = false;
       guessedRight = false; 
       typing = "";
       numRight = 0; 
       numWrong = 0; 
       winner = 0; 
       display = "Geben Sie nur einen Buchstaben ein (keine Großbuchstaben)";
       display2 = "und drücken Sie Enter!";  
       setup();
       draw();     
}  
  

     if (keyCode == DOWN)
     {
        anfang = false;
        return;
     }
     
     if(keyCode == RIGHT)
     {
         typing = " ";
         guess = " ";
         counter2 = 0;
         counter = 0;
         Gewonnen = false;
         Verloren = false;
         guessedRight = false; 
         numRight = 0; 
         numWrong = 0; 
         winner = 0; 
         display = "Geben Sie nur einen Buchstaben ein (keine Großbuchstaben)";
         display2 = "und drücken Sie Enter!";       
         anfang = true; 
     }     
}  


void play(String guess) // Prüfung ob Gewonnen oder Verloren
{
    guessedRight = false; //Ist zunächst falsch
    guess = guess.toUpperCase();
    char myGuess = guess.charAt(0);
  
     for (int q = 0;q < answer.length();q++)
     {
      if (guessed[q] == myGuess)
      {
          counter3 = counter3 +1;
      }
      
      if (counter3 >= 1 & hoch == false) //Damit Falsch einmal erhöht wird
      {
          falsch++; 
          hoch = true;
          return;
      }
      
      
      
       while (counter3 >= 1) //Abbruch, wenn Spieler versucht zu schummeln
      { 
          typing = "";
          guess = "";
          return; 
      }
}
  
      
//^^   
//Obiger Code nur für den Fall dass der Spieler versucht, einen Buchstaben, der ins Array guessed gehört, 2 mal hintereinander oder im späteren Spielverlauf einzugeben und somit das Event Gewonnen auslöst obwohl das Falsch ist      
      
      
 for (int c = 0; c < answer.length(); c++)
  {
    println(myGuess, answer.charAt(c));
    
    if (myGuess == answer.charAt(c))
    {
      guessed[c] = myGuess; // myGuess wird ins Array guessed an die stelle c geschrieben
      numRight +=1; // numRight wird um 1 erhöht
      guessedRight = true; //Dann richtig
      
      if (numRight == winner) // Prüfung, ob Gewonnen oder Verloren
      {
          Gewonnen = true;
          richtig++;
          display = "DU HAST GEWONNEN!";
          display2 = "Zum Neustart ''Pfeil nach oben'' drücken!";
          return;
      }
   }
}
 
  println(guessedRight);
  {
  if (Gewonnen == true)
  {
     return; 
  }
  else 
  
  if (guessedRight == false)
  { 
    counter2 = counter2 +1; //Counter2 für das Anzeigen der Bilder
    wrong[numWrong] = myGuess; //myGuess wird ins Array wrong an die Stelle numWrong geschrieben     
    numWrong += 1; // Erhöhung von numWrong            
    if (numWrong == 10) //Überprüfung ob numWrong 10 ist
    {
        hilfe = typing;
        falsch++;
        Verloren = true;      
        display = "DU HAST VERLOREN!";
        display2 = "Zum Neustart ''Pfeil nach oben'' drücken!";
        image(img10,300, 45, 300,300);
        return;
     }
    }
  }
}

//////////////////////////
  
//QUELLENANGABEN:

// https://processing.org/examples/random.html --> Für Random Funktion
// https://processing.org/examples/functions.html -> Für Funktionen und Funktionen mit Parameterübergabe
// https://processing.org/examples/array.html -> Für 1 Dimensionale Arrays
// https://processing.org/examples/loaddisplayimage.html -> Für das Anzeigen der Images (Hang Man)
// https://processing.org/examples/keyboardfunctions.html -> Für KeyPressed und Key Events auszulösen
// http://www.farb-tabelle.de/de/farbtabelle.htm -> Farbtabelle mit Farbcodes
// https://processing.org/examples/truefalse.html -> Für True und False Abfragen
// https://processing.org/reference/String_charAt_.html -> Returns the character at the specified index. An index ranges from 0 to the length of the string minus 1. The first character of the sequence is at index 0, the next at index 1, etc.

//////////////////////////
