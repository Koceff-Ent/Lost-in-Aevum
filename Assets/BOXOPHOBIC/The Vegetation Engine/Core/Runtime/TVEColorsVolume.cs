// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;

namespace TheVegetationEngine
{
    [ExecuteInEditMode]
    [AddComponentMenu("BOXOPHOBIC/The Vegetation Engine/TVE Colors Volume (Deprecated)")]
    public class TVEColorsVolume : StyledMonoBehaviour
    {
        [StyledBanner(0.890f, 0.745f, 0.309f, "Colors Volume (Deprecated)", "", "https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.x0vwa8kwumd")]
        public bool styledBanner;

        [Range(0.0f, 1.0f)]
        public float volumeVisibility = 0.5f;

        [Space(10)]
        public float volumeSize = 100.0f;
        public float volumeHeight = 50.0f;

        [Space(10)]
        public ElementsVisibility elementsVisibility = ElementsVisibility.HiddenInGame;
        [HideInInspector]
        public ElementsVisibility elementsVisibilityOld = ElementsVisibility.HiddenInGame;

        public ElementsSorting elementsSorting = ElementsSorting.Realtime;

        public TextureSizes renderResolution = TextureSizes._512;
        [HideInInspector]
        public TextureSizes renderResolutionOld = TextureSizes._512;

        public TextureWrapMode renderWrapMode = TextureWrapMode.Repeat;
        [HideInInspector]
        public TextureWrapMode renderWrapModeOld = TextureWrapMode.Repeat;

        public bool renderEdgeFade = false;
    }
}
