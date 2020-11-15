using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pin : MonoBehaviour
{
    [SerializeField] GameObject interactionMessage;
    [SerializeField] GameObject playerController;
    
    private void OnTriggerStay(Collider collider)
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
          //  collider.gameObject.SetActive(false);
            playerController.transform.position.Set(2, 3, 4);
            
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
