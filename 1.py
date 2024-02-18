import os

def create_new_file():
    global filename, lines
    new_filename = input("Unesi novo ime datoteke: ")

   
    with open(new_filename, 'w') as file:
        file.write("")

    filename = os.path.abspath(new_filename)  
    lines = []
    print(f"Nova datoteka '{filename}' stvorena.")


def open_file():
    global filename, lines
    filename = input("Ime datoteke: ")
    script_directory = os.path.dirname(os.path.realpath(__file__))

    try:
        full_path = os.path.join(script_directory, filename)
        with open(full_path, 'r') as file:
            lines = file.readlines()
        print("Datoteka uspješno otvorena.")
    except FileNotFoundError:
        print("Error: Nemoguće otvoriti datoteku.")



def save_file():
    global filename, lines
    if filename:
        with open(filename, 'w') as file:
            file.writelines(lines)
        print("Datoteka uspješno spremljena.")
    else:
        print("Error: Datoteka trenutno nije otvorena.")
        
        
def add_text_to_file():
    global lines
    if lines is not None:
        additional_text = input("Unesi tekst koji dodajem (unesi 'END' za kraj unosa):\n")
        while additional_text.upper() != 'END':
            lines.append(additional_text + '\n')
            additional_text = input()

        print("Tekst uspješno dodan u datoteku.")
    else:
        print("Error: Datoteka trenutno nije otvorena.")
        


def edit_file():
    global filename, lines
    if filename:
        line_number = int(input("Unesi broj retka koji mijenjam: "))
        if 1 <= line_number <= len(lines):
            print(f"Trenutni tekst retka {line_number}: {lines[line_number - 1]}")
            new_text = input("Unesi novi tekst (unesi '0' za brisanje retka):\n")
            if new_text == '0':
                del lines[line_number - 1]
                print(f"Redak {line_number} izbrisan.")
            else:
                lines[line_number - 1] = new_text + "\n"
                print(f"Tekst retka {line_number} promjenjen.")
        else:
            print(f"Error: redak broj {line_number} je izvan dometa.")
    else:
        print("Error: Datoteka trenutno nije otvorena.")


def read_file():
    global lines
    if lines:
        print("Sadržaj datoteke:")
        for line in lines:
            print(line, end='')
    else:
        print("Error: Datoteka nije otvorena ili je prazna.")



global filename, lines
filename = ""
lines = []

print("Jednostavni text editor (Python)")

while True:
    print("\nOdaberite:")
    print("1. Stvori novu datoteku")
    print("2. Otvori datoteku")
    print("3. Spremi")
    print("4. Dodaj tekst u datoteku")
    print("5. Promjeni tekst datoteke")
    print("6. Procitaj datoteku")
    print("7. Izadji")

    choice = input("Unesi odabir: ")
    print("___________________________________\n\n")

    if choice == '1':
        create_new_file()
        print("___________________________________\n\n")

    elif choice == '2':
        open_file()
        print("___________________________________\n\n")

    elif choice == '3':
        save_file()
        print("___________________________________\n\n")
    elif choice == '4':
        add_text_to_file()
        print("___________________________________\n\n")
    elif choice == '5':
        edit_file()
        print("___________________________________\n\n")
    elif choice == '6':
        read_file()
        print("___________________________________\n\n")
    elif choice == '7':
        print("Izlaz....")
        print("___________________________________\n\n")
        break
    else:
        print("Krivi odabir. Pokušaj ponovno.")
        print("___________________________________\n\n")