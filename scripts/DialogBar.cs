using Dialogs;
using Godot;
using System.Collections.Generic;

public partial class DialogBar : PanelContainer
{
	private RichTextLabel dialogTextNode;
	private List<string> messages = new ();
	private int actualMessage = 0;
	private int textPosition = 0;
	private int delay = 0;
	private readonly int time_to_reset = 5; 

	private bool hasNext = false;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		dialogTextNode = GetNode<RichTextLabel>("DialogBarText");
		hasNext = true;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(delay == time_to_reset){
			delay = 0;
			if(hasNext&&textPosition < messages[actualMessage].Length && actualMessage < messages.Count){
				dialogTextNode.Text += messages[actualMessage][textPosition];
				textPosition++;
			}
		}
		delay++;
	}
	public bool NextMessage()
	{
		if(textPosition < messages[actualMessage].Length){
			dialogTextNode.Text = messages[actualMessage];
			textPosition = messages[actualMessage].Length;
			return true;
		}
		actualMessage++;
		textPosition=0;
		dialogTextNode.Text = "";
		hasNext = actualMessage < messages.Count;
		return hasNext;
	}

	public void ShowMessages(string actualDialog)
	{
		DialogsClass dialogs = new DialogsClass();
		var texts = dialogs.GetDictionary();
		foreach (string msg in texts[actualDialog])
		{
			messages.Add(msg);
		}
		// messages.Add("Texto aleatorio generado porque me da la gana.");
		// messages.Add("Segundo texto aleatorio generado porque me da la gana.");
		// messages.Add("Tercer aleatorio generado porque me da la gana.");
		// messages.Add("Caraculo.");
		actualMessage = 0;
		textPosition = 0;
		dialogTextNode.Text = "";
	}
	public bool GetHasNext(){
		return hasNext;
	}
}
