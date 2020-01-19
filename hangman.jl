
using Gtk

win = false
health = 0

function Turn()
    println("Write a word")
    global word = string(readline())
    global wordarray = collect(word)
    global guessarray = fill('_', length(wordarray))
    global guess = join(guessarray)
    println("\n")
end

function Draw()
    global health = health+1
    println(health)
    if(health==1)
        i = GtkImage("assets/Hangman-0.png")
        
        elseif(health==2)
            i = GtkImage("assets/Hangman-1.png")
        
        elseif(health==3)
            i = GtkImage("assets/Hangman-2.png")
        
        elseif(health==4)
            i = GtkImage("assets/Hangman-3.png")
        
        elseif(health==5)
            i = GtkImage("assets/Hangman-4.png")
        
        elseif(health==6)
            i = GtkImage("assets/Hangman-5.png")
        
        elseif(health==7)
            i = GtkImage("assets/Hangman-6.png")
    end
    w = GtkWindow(i,"Hangman")
    show(i);
end

function Guess()
    found = false
    println("Enter the letter")
    letter = readline()
    letter = collect(letter)
    for i=1:length(wordarray)
        
       if(wordarray[i]==letter[1])
            guessarray[i] = wordarray[i]
            found = true
        end     
    end
    if(found == false)
       Draw() 
    end
    guess = join(guessarray)
    print(guess, "\n \n")
end

Turn()
println("Word length: ", length(wordarray),"\n")
println(guess)
while(health<7 && win == false)
    Guess()
    if(guessarray == wordarray)
       win = true
        println("Win")
    end
    
    if(health==7)
       println("Lose") 
    end
end






