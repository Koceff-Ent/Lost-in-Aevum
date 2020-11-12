using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pin : MonoBehaviour
{
       

    private void OnTriggerStay(Collider collider)
    {
        if (Input.GetKeyDown(KeyCode.E)&& collider.CompareTag("Player"))
        {
            //Execution Code
             Debug.Log("E pressed and collider endered");
        }
    }


}
