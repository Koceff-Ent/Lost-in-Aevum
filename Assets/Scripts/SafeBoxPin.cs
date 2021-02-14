using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class SafeBoxPin : MonoBehaviour
{
    [SerializeField] string correctCode;
    [SerializeField] TextMeshProUGUI code;
    [SerializeField] Animator animatorDoorOpen;
    [SerializeField] BoxCollider triggerCollider;
    [SerializeField] ControllerState player;



    private void OnTriggerStay(Collider collider)
    {

        //If code inputed is 4 didgits
        if (code.text.Length == 4)
        {
            //If its correct
            if (code.text.Equals(correctCode))
            {
                FindObjectOfType<AudioManager>().Play("Correct");
             //   FindObjectOfType<AudioManager>().Play("DoorOpenSound");
                Cursor.lockState = CursorLockMode.Locked;
                triggerCollider.enabled = false;
                animatorDoorOpen.Play("SafeBox Open", 0, 0.0f);
                player.UnFreezeController();

            }
            //If incorrect
            else
            {
                code.text = "";
                FindObjectOfType<AudioManager>().Play("Wrong");

            }
        }
    }

}
