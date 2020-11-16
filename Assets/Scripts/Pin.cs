using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pin : MonoBehaviour
{
    [SerializeField] GameObject interactionMessage;
    Vector3 scaleSize = new Vector3(0, 0, 0);
    private void OnTriggerStay(Collider collider)
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            // Code to be executed on E pressed, while in range

        }
    }


    private void OnTriggerEnter(Collider collider)
    {
        if (collider.CompareTag("Player"))
              interactionMessage.gameObject.SetActive(true);

    }

    private void OnTriggerExit(Collider collider)
    {

        if (collider.CompareTag("Player"))
            interactionMessage.gameObject.SetActive(false);


    }
}
