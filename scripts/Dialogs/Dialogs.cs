using System.Collections.Generic;
using Godot;

namespace Dialogs;

public partial class Dialogs : Node
{
	public readonly Dictionary<string, Dictionary<string, List<string>>> Texts = new();
	
    public List<string> GetDialogSet(string npcName, string npcDialogState)
    {
        return Texts[npcName][npcDialogState];
    }

	public Dialogs()
	{
        Texts["jose"] = JoseDialogs();
	}

	private Dictionary<string, List<string>> JoseDialogs()
	{
		var jose_dialogs = new Dictionary<string, List<string>> ();
		// Muerte 1
		var jose_muerte1 = new List<string>
		{
			"Te has encajado una espina de un aspecto sospechoso.",
			"No mueres ni nada, pero enfermas de una enfermedad grave y desconocida...",
			"Adivina cuál es la diferencia entre tú y una iglesia abandonada.",
			"Resulta que ninguno de los dos tiene cura."
		};
		jose_dialogs["muerte1"] = jose_muerte1;
		// Muerte 2

		var jose_muerte2 = new List<string>
		{
			"Luego de esto tu vida pasa a segundo plano.",
			"Porque te [b]moriste[b].",
			"Pero miremos el lado bueno...",
			"Por fin conocerás a tu abuelo Vicente :)"
		};
		jose_dialogs["muerte2"] = jose_muerte2;

		// Muerte 3

		var jose_muerte3 = new List<string>
		{
			"Crees que morir es divertido?",
			"Ya basta, eso duele.",
			"Lo normal es morir una sola vez, pero parece abusar de tu privilegio se ha vuelto costumbre."
		};
		
		jose_dialogs["muerte3"] = jose_muerte3;

		// Muerte 4 (A partir de la cuarta muerte siempre se debe mostrar esta)

		var jose_muerte4 = new List<string>
		{
			"AHHHHHH &*%^(^(*&^(T$%^#%&)))"
		};
		jose_dialogs["muerte4"] = jose_muerte4;

		// Dialogo inicial

		var dialogo_inicial = new List<string> 
		{
			"\"Mi salario no alcanza.\"",
			"Jose necesita volver al otro lado, pero su salario no le alcanza...",
			"Principalmente porque no tiene."
		};

		jose_dialogs["dialogo_inicial"] = dialogo_inicial;

		var dialogo_explicativo1 = new List<string>
		{
			"Todos son muy complicados, pero con un escaneo adecuado podemos llegar a ver con nuestros ojos todo lo que otros piensan.",
			"Te encuentras en las entrañas del capitalismo y tu misión es reunir dinero.",
            "No puedes volver mientras tu mision no se encuentre completada.",
            "Hay monstruos que te impiden conseguir tu objetivo.",
            "Saben que tu sueldo no te alcanzaría ni para conseguir matrimonio...",
            "... y deberías agradecer...",
			"Pero tu objetivo es salir de las entrañas, así que deberás conseguir salario a costa de aquello que los monstruos no quieren."
		};
		jose_dialogs["dialogo_explicativo1"] = dialogo_explicativo1;


		var dialogo_explicativo_lvl_1 = new List<string>
		{
			"Entre la multitud muchos intentarán confundirte, incluso navegar por sitios que no te llevan a ningún lugar",
			"Algunos pueden decir que tienen la respuesta para tus problemas, pero seamos realistas, ",
			"tus organos tienen buen precio en eol mercado negro. Hay que ser cuidadoso"
		};
		jose_dialogs["dialogo_explicativo_lvl_1"] = dialogo_explicativo_lvl_1;

		return jose_dialogs;
	}
}
