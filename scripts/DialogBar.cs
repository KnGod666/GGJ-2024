using Dialogs;
using Godot;

public partial class DialogBar : PanelContainer
{
	private readonly string ACTION = "accion";
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
		Hide();
		dialogTextNode = GetNode<RichTextLabel > ("DialogBarText");
		hasNext = true;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(delay == time_to_reset){
			delay = 0;
			if(hasNext && textPosition < messages[actualMessage].Length && actualMessage < messages.Count){
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

	public void ShowMessages(string npcName, string npcDialogState)
	{
		Show();
		DialogsClass dialogs = new DialogsClass();
		var texts = dialogs.GetDialogSet(npcName, npcDialogState);
		foreach (string msg in texts)
		{
			messages.Add(msg);
		}
		actualMessage = 0;
		textPosition = 0;
		dialogTextNode.Text = "";
	}

	public override void _Input(InputEvent @event)
	{
		base._Input(@event);
		if(@event.IsActionPressed(ACTION)){
			if(!NextMessage())
			{
				Hide();
			}
		}
	}
	public void prueba(){
		GD.Print("------------------------------------------------------------------------------------");
	}
}
