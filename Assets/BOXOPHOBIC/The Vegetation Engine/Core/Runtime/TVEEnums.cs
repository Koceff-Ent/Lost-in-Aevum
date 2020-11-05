// Cristian Pop - https://boxophobic.com/

namespace TheVegetationEngine
{
    public enum TextureSizes
    {
        _32 = 32,
        _64 = 64,
        _128 = 128,
        _256 = 256,
        _512 = 512,
        _1024 = 1024,
        _2048 = 2048,
        _4096 = 4096,
    }

    public enum RenderPreview
    {
        Motion = 10,
        Colors = 20,
        Extras = 30,
    }

    public enum ElementType
    {
        Undefined = -1,
        Motion = 0,
        Colors = 1,
        Extras = 2,
    }

    public enum RendererType
    {
        Mesh = 0,
        Particle = 1,
    }

    public enum PropertyType
    {
        Texture = 0,
        Vector = 1,
        Value = 2,
    }

    public enum ElementsVisibility
    {
        AlwaysHidden = 0,
        AlwaysVisible = 10,
        HiddenInGame = 20,
    }

    public enum ElementsSorting
    {
        Once = 0,
        Realtime = 10,
    }

    public enum ToggleMode
    {
        Off = 0,
        On = 1,
    }

    public enum LinkMode
    {
        FirstToSecond = 0,
        SecondToFirst = 1,
    }
}