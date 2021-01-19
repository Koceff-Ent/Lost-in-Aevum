using UnityEngine;

public class WaterJugScript : MonoBehaviour
{
    [SerializeField] Animator animatorMiddleValve;


    private void OnTriggerStay(Collider collider)
    {
        //Raycast to see if a valve is clicked with the cursor
        if (Input.GetMouseButton(0))
        {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            //If a gameObject is hit by the raycast
            if (Physics.Raycast(ray, out hit, 100.0f))
                if (hit.transform != null)
                {
                    if (hit.transform.gameObject.name.Equals("MiddleValve"))
                    {
                        animatorMiddleValve.Play("ValveSpin", 0, 0.0f);
                 //       animatorMiddleValve.Play("BigWaterReduce", 1, 0.0f);
                 //       animatorMiddleValve.Play("SmallWaterIncrease", 2, 0.0f);
                    }else if (hit.transform.gameObject.name.Equals("LeftValve"))
                    {
                        animatorMiddleValve.Play("LeftValveOpen", 4, 0.0f);
                        animatorMiddleValve.Play("BigWaterReduce", 1, 0.0f);
                        //Water dropping particle
                    }else if (hit.transform.gameObject.name.Equals("RightValve"))
                    {
                        animatorMiddleValve.Play("RightValveOpen", 5, 0.0f);
                        animatorMiddleValve.Play("SmallWaterReduce", 3, 0.0f);
                        //Water dropping particle
                    }


                }

        }
        

    }

}
