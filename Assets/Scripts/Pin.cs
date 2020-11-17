using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class Pin : MonoBehaviour
{
    [SerializeField] GameObject interactionMessage;
    [SerializeField] TextMeshProUGUI code;
    [SerializeField] Animator animator;
    [SerializeField] BoxCollider triggerCollider;
    [SerializeField] ControllerState player;
    bool cursorShown = false;


   
    private void OnTriggerStay(Collider collider)
    {
        //Code executed on E pressed, while in range
        if (Input.GetKeyDown(KeyCode.E))
        {
            if (cursorShown == false)
            {
                player.FreezeController();
                Cursor.lockState = CursorLockMode.Confined;
                Cursor.visible = true;
                interactionMessage.gameObject.SetActive(false);
                cursorShown = true;
            }
            else
            {
                player.UnFreezeController();
                DisableEverything(ref cursorShown);
                interactionMessage.gameObject.SetActive(true);

            }
        }



        //If code inputed is 4 didgits
        if (code.text.Length == 4)
        {
            //If its correct
            if (code.text.Equals("2472"))
            {
                FindObjectOfType<AudioManager>().Play("Correct");
                DisableEverything(ref cursorShown);
                triggerCollider.enabled = false;
                animator.Play("DoorOpen", 0, 0.0f);
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


    private void OnTriggerEnter(Collider collider)
    {
        if (collider.CompareTag("Player"))
            interactionMessage.gameObject.SetActive(true);

    }



    private void OnTriggerExit(Collider collider)
    {
        if (collider.CompareTag("Player"))
        {
            interactionMessage.gameObject.SetActive(false);
            DisableEverything(ref cursorShown);
        }
    }

    private static void DisableEverything(ref bool cursorShown)
    {
        Cursor.lockState = CursorLockMode.Locked;
        cursorShown = false;
    }



}
