using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class PinButtonHandler : MonoBehaviour
{

    public void CodeAddOne(TextMeshProUGUI code)
    {
        code.text += "1";
        
    }
    public void CodeAddTwo(TextMeshProUGUI code)
    {
        code.text += "2";

    }
    public void CodeAddThree(TextMeshProUGUI code)
    {
        code.text += "3";

    }
    public void CodeAddFour(TextMeshProUGUI code)
    {
        code.text += "4";

    }
    public void CodeAddFive(TextMeshProUGUI code)
    {
        code.text += "5";

    }
    public void CodeAddSix(TextMeshProUGUI code)
    {
        code.text += "6";

    }
    public void CodeAddSeven(TextMeshProUGUI code)
    {
        code.text += "7";

    }
    public void CodeAddEight(TextMeshProUGUI code)
    {
        code.text += "8";

    }
    public void CodeAddNine(TextMeshProUGUI code)
    {
        code.text += "9";

    }
    public void CodeAddZero(TextMeshProUGUI code)
    {
        code.text += "0";


    }
    public void Clear(TextMeshProUGUI code)
    {
        if (code.text.Length>0)
        code.text = code.text.Substring(0,code.text.Length-1);
    }

 



}
