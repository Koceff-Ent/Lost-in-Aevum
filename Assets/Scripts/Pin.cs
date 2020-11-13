using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pin : MonoBehaviour
{
    [SerializeField] GameObject interactionMessage;


    private void OnTriggerStay(Collider collider)
    {
        if (Input.GetKeyDown(KeyCode.E))
            collider.gameObject.SetActive(false);
        Debug.Log("E pressed");
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
