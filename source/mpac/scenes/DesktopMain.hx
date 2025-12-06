package mpac.scenes;

import mpac.objects.Declo;

class DesktopMain extends Scene
{
	override public function new()
	{
		super('desktop_main');
	}

    public var declo:Declo;

    override function create() {
        super.create();

        declo = new Declo();
        add(declo);
        
        declo.screenCenter();
    }
}
