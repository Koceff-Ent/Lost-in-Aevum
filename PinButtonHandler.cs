using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class PinButtonHandler : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField] TextMeshProUGUI code;
    public void SetCode(string str)
    {
        TextMeshProUGUI text = transform.Find("TextMeshProUGUI").GetComponent<TextMeshProUGUI>();
        text.text = str;
}

    private void Start()
    {
        code.text = "2";
    }

}
