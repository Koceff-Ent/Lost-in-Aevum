using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class PinButtonHandler : MonoBehaviour
{
    AudioSource audioSource;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }


    public void CodeAddOne(TextMeshProUGUI code)
    {
        code.text += "1";
        audioSource.Play();
        
    }
    public void CodeAddTwo(TextMeshProUGUI code)
    {
        code.text += "2";
        audioSource.Play();
    }
    public void CodeAddThree(TextMeshProUGUI code)
    {
        code.text += "3";
        audioSource.Play();
    }
    public void CodeAddFour(TextMeshProUGUI code)
    {
        code.text += "4";
        audioSource.Play();
    }
    public void CodeAddFive(TextMeshProUGUI code)
    {
        code.text += "5";
        audioSource.Play();
    }
    public void CodeAddSix(TextMeshProUGUI code)
    {
        code.text += "6";
        audioSource.Play();
    }
    public void CodeAddSeven(TextMeshProUGUI code)
    {
        code.text += "7";
        audioSource.Play();
    }
    public void CodeAddEight(TextMeshProUGUI code)
    {
        code.text += "8";
        audioSource.Play();
    }
    public void CodeAddNine(TextMeshProUGUI code)
    {
        code.text += "9";
        audioSource.Play();
    }
    public void CodeAddZero(TextMeshProUGUI code)
    {
        code.text += "0";
        audioSource.Play();

    }
    public void Clear(TextMeshProUGUI code)
    {
        if (code.text.Length>0)
        code.text = code.text.Substring(0,code.text.Length-1);
    }

 



}
