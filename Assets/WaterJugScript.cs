using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class WaterJugScript : MonoBehaviour
{
    [SerializeField] GameObject interactionMessage;
    [SerializeField] Animator animatorWaterJug;
    [SerializeField] Animator animatorImageFade;
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
                Cursor.visible = true;
                Cursor.lockState = CursorLockMode.Confined;
                animatorImageFade.Play("Interaction Message FadeOut", 0, 0.0f);
                cursorShown = true;
            }
            else
            {
                player.UnFreezeController();
                DisableEverything(ref cursorShown);
                animatorImageFade.Play("Interaction Message Fade", 0, 0.0f);

            }
        }

        //Raycast to see if a valve is clicked with the cursor
        if (Input.GetMouseButton(0))
        {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out hit, 100.0f))
                if (hit.transform != null && hit.transform.gameObject.name.Equals("Valve"))
                {
                    animatorWaterJug.Play("ValveSpin", 0, 0.0f);
                    animatorWaterJug.Play("BigWaterReduce", 1, 0.0f);
                    animatorWaterJug.Play("SmallWaterIncrease", 2, 0.0f);

                }
        }

    }


    private void OnTriggerEnter(Collider collider)
    {
        if (collider.CompareTag("Player"))
         //   interactionMessage.gameObject.SetActive(true);
        animatorImageFade.Play("Interaction Message Fade", 0, 0.0f);
    }



    private void OnTriggerExit(Collider collider)
    {
        if (collider.CompareTag("Player"))
        {
            animatorImageFade.Play("Interaction Message FadeOut", 0, 0.0f);
            DisableEverything(ref cursorShown);
        }
    }

    private static void DisableEverything(ref bool cursorShown)
    {
        cursorShown = false;
        Cursor.lockState = CursorLockMode.Locked;
    }



}
