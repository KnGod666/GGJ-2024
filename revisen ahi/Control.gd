class_name "DialogsClass"

extends Node

var Texts = Dictionary()

func GetDialogSet(npcName, npcDialogState):
    return Texts[npcName][npcDialogState]

func _init():
    Texts["jose"] = JoseDialogs()

func JoseDialogs():
    var jose_dialogs = Dictionary()
    # Muerte 1
    var jose_muerte1 = ["Te has encajado una espina de un aspecto sospechoso.", "No mueres ni nada, pero enfermas de una enfermedad grave y desconocida...", "Adivina cuál es la diferencia entre tú y una iglesia abandonada.", "Resulta que ninguno de los dos tiene cura."]
    jose_dialogs["muerte1"] = jose_muerte1
    # Muerte 2

    var jose_muerte2 = ["Luego de esto tu vida pasa a segundo plano.", "Porque te [b]moriste[b].", "Pero miremos el lado bueno...", "Por fin conocerás a tu abuelo Vicente :)"]
    jose_dialogs["muerte2"] = jose_muerte2

    # Muerte 3

    var jose_muerte3 = ["Crees que morir es divertido?", "Ya basta, eso duele.", "Lo normal es morir una sola vez, pero parece abusar de tu privilegio se ha vuelto costumbre."]
    
    jose_dialogs["muerte3"] = jose_muerte3

    # Muerte 4 (A partir de la cuarta muerte siempre se debe mostrar esta)

    var jose_muerte4 = ["AHHHHHH &*%^(^(*&^(T$%^#%&)))"]
    jose_dialogs["muerte4"] = jose_muerte4

    # Dialogo inicial

    var dialogo_inicial = ["\"Mi salario no alcanza.\"", "Jose necesita volver al otro lado, pero su salario no le alcanza...", "Principalmente porque no tiene."]

    jose_dialogs["dialogo_inicial"] = dialogo_inicial

    var dialogo_explicativo1 = ["Vas a necesitar conexión a int"]

    jose_dialogs["dialogo_explicativo1"] = dialogo_explicativo1

    return jose_dialogs
